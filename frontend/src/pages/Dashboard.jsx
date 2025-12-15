import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import MatchCard from '../components/MatchCard';
import SearchFilters from '../components/SearchFilters';
import ProfileModal from '../components/ProfileModal';
import ConfirmationModal from '../components/ConfirmationModal';
import Toast from '../components/Toast';
import EditProfile from '../components/EditProfile';

import Sidebar from '../components/Sidebar';

const Dashboard = () => {
    const navigate = useNavigate();
    const [user, setUser] = useState(null);
    const [subscriptions, setSubscriptions] = useState([]);
    const [matches, setMatches] = useState([]);
    const [loading, setLoading] = useState(true);
    const [matchesLoading, setMatchesLoading] = useState(false);
    const [error, setError] = useState('');
    const [showPlans, setShowPlans] = useState(false);
    const [selectedProfile, setSelectedProfile] = useState(null);
    const [toast, setToast] = useState(null);
    const [visibleMatches, setVisibleMatches] = useState(10);
    const [showResults, setShowResults] = useState(false);

    // New Navigation State
    const [activeTab, setActiveTab] = useState('discover'); // 'discover', 'likes', 'profile'
    const [likedProfiles, setLikedProfiles] = useState([]);

    const handleShowMore = () => {
        setVisibleMatches(prev => prev + 10);
    };

    const handleShowLess = () => {
        setVisibleMatches(10);
        window.scrollTo({ top: 0, behavior: 'smooth' });
    };

    const handleBackToSearch = () => {
        setShowResults(false);
        setMatches([]); // Optional: clear matches or keep them? User said "go back searching again", implying reset.
        setVisibleMatches(10);
    };

    // Confirmation Modal State
    const [confirmModal, setConfirmModal] = useState({
        isOpen: false,
        userId: null
    });

    useEffect(() => {
        const fetchData = async () => {
            try {
                const token = localStorage.getItem('token');
                if (!token) {
                    navigate('/login');
                    return;
                }

                const userId = localStorage.getItem('userId');
                if (!userId) {
                    navigate('/login');
                    return;
                }

                // Fetch User Details
                const userRes = await fetch(`/api/v1/users/${userId}`, {
                    headers: { 'Authorization': `Bearer ${token}` }
                });

                if (!userRes.ok) throw new Error('Failed to fetch user profile');
                const userData = await userRes.json();
                setUser(userData);

                // Fetch Subscriptions
                const subRes = await fetch('/api/v1/subscriptions');
                if (subRes.ok) {
                    const subData = await subRes.json();
                    setSubscriptions(subData);
                }

            } catch (err) {
                console.error(err);
                setError('Failed to load dashboard data');
                if (err.message.includes('fetch user')) {
                    localStorage.removeItem('token');
                    navigate('/login');
                }
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, [navigate]);


    const handleUpgrade = async (subscriptionId) => {
        try {
            const token = localStorage.getItem('token');
            const response = await fetch('/api/v1/users/subscription', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}`
                },
                body: JSON.stringify({ newSubscriptionId: subscriptionId })
            });

            if (!response.ok) throw new Error('Failed to update subscription');

            const updatedUser = await response.json();
            setUser(updatedUser);
            setShowPlans(false);
            showToast('Subscription updated successfully!', 'success');
        } catch (err) {
            showToast(err.message, 'error');
        }
    };

    const handleSearch = async (searchRequest) => {
        setMatchesLoading(true);
        try {
            const token = localStorage.getItem('token');
            const response = await fetch('/api/v1/matches/search', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}`
                },
                body: JSON.stringify(searchRequest)
            });

            if (!response.ok) throw new Error('Failed to search profiles');

            const matchesData = await response.json();
            setMatches(matchesData);
            setVisibleMatches(10);
            if (matchesData.length > 0) {
                setShowResults(true);
            }

            // Refresh user data to update query count
            await refreshUserData();

            if (matchesData.length === 0) {
                showToast('No profiles found matching your criteria', 'warning');
            }
        } catch (err) {
            showToast('Failed to search profiles: ' + err.message, 'error');
        } finally {
            setMatchesLoading(false);
        }
    };

    const handleViewProfile = (profile) => {
        setSelectedProfile(profile);
    };

    const handleCloseModal = () => {
        setSelectedProfile(null);
    };

    const showToast = (message, type = 'info') => {
        setToast({ message, type });
    };

    const refreshUserData = async () => {
        try {
            const token = localStorage.getItem('token');
            const userId = localStorage.getItem('userId');
            const userRes = await fetch(`/api/v1/users/${userId}`, {
                headers: { 'Authorization': `Bearer ${token}` }
            });
            if (userRes.ok) {
                const userData = await userRes.json();
                setUser(userData);
            }
        } catch (err) {
            console.error('Failed to refresh user data', err);
        }
    };

    const handleConnect = async (userId) => {
        try {
            const token = localStorage.getItem('token');
            const response = await fetch(`/api/v1/users/${userId}/like`, {
                method: 'POST',
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            });

            if (!response.ok) {
                const msg = await response.text();
                throw new Error(msg || 'Failed to connect');
            }

            const updatedUserData = await response.json();
            setUser(updatedUserData);

            // Remove from current matches display (optimistic update)
            setMatches(prev => prev.filter(m => m.userId !== userId));

            showToast('Connected successfully!', 'success');
        } catch (err) {
            showToast(err.message || 'Failed to connect', 'error');
        }
    };

    const initiateRemoveLike = (userId) => {
        setConfirmModal({
            isOpen: true,
            userId: userId
        });
    };

    const handleConfirmRemove = async () => {
        setConfirmModal({ isOpen: false, userId: null }); // Close modal immediately
        const userId = confirmModal.userId;
        if (!userId) return;

        try {
            const token = localStorage.getItem('token');
            const response = await fetch(`/api/v1/users/${userId}/like`, {
                method: 'DELETE',
                headers: {
                    'Authorization': `Bearer ${token}`
                }
            });

            if (!response.ok) {
                throw new Error('Failed to remove like');
            }

            const updatedUserData = await response.json();
            setUser(updatedUserData);

            // Update local state immediately
            setLikedProfiles(prev => prev.filter(p => p.userId !== userId));
            showToast('Profile removed from likes', 'success');
        } catch (err) {
            showToast(err.message || 'Failed to remove like', 'error');
        }
    };

    const fetchLikedProfiles = async () => {
        try {
            const token = localStorage.getItem('token');
            const response = await fetch('/api/v1/users/likes', {
                headers: { 'Authorization': `Bearer ${token}` }
            });

            if (response.ok) {
                const data = await response.json();
                setLikedProfiles(data);
            }
        } catch (err) {
            console.error('Failed to fetch likes', err);
        }
    };

    useEffect(() => {
        if (activeTab === 'likes') {
            fetchLikedProfiles();
        }
    }, [activeTab]);

    const handleLogout = () => {
        localStorage.removeItem('token');
        localStorage.removeItem('userId');
        navigate('/login');
    };

    if (loading) return <div style={{ paddingTop: '120px', textAlign: 'center', color: 'var(--color-text-muted)' }}>Loading...</div>;

    return (
        <div style={{ display: 'flex', minHeight: '100vh', background: 'var(--color-bg)' }}>

            <Sidebar
                user={user}
                activeTab={activeTab}
                setActiveTab={(tab) => {
                    setActiveTab(tab);
                    setShowPlans(false); // Close plans if switching tabs
                    if (tab === 'discover') setShowResults(false); // Reset search on tab switch? Or keep it? Let's keep it for now.
                }}
                onLogout={handleLogout}
            />

            <div className="main-content animate-fade-in" style={{
                flex: 1,
                marginLeft: '280px',
                padding: '3rem 4rem',
                maxWidth: '1600px' // Prevent it from getting too wide on huge screens
            }}>

                {/* Header Section */}
                <div style={{ marginBottom: '3rem', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                    <div>
                        <h2 style={{
                            fontSize: '2.5rem',
                            fontWeight: 'bold',
                            fontFamily: 'var(--font-heading)',
                            color: 'var(--color-text-main)',
                            marginBottom: '0.5rem'
                        }}>
                            {activeTab === 'discover' && 'Discover Matches'}
                            {activeTab === 'likes' && 'Your Connections'}
                            {activeTab === 'profile' && 'Edit Profile'}
                        </h2>
                        <p style={{ color: 'var(--color-text-muted)', fontSize: '1.1rem' }}>
                            {activeTab === 'discover' && 'Find your perfect soulmate today.'}
                            {activeTab === 'likes' && 'People you have connected with.'}
                            {activeTab === 'profile' && 'Update your personal details.'}
                        </p>
                    </div>

                    {/* Stats Widget - Only show on Discover tab for cleanliness, or always? Let's keep it on Discover */}
                    {activeTab === 'discover' && (
                        <div className="glass-panel" style={{
                            display: 'flex',
                            alignItems: 'center',
                            gap: '2rem',
                            padding: '1rem 2rem',
                            background: 'white',
                            border: '1px solid var(--color-border)'
                        }}>
                            <div className="stat-item">
                                <div style={{ fontSize: '0.8rem', color: 'var(--color-text-muted)', textTransform: 'uppercase', letterSpacing: '0.05em' }}>Daily Queries</div>
                                <div style={{ fontSize: '1.2rem', fontWeight: 'bold', color: 'var(--color-text-main)' }}>
                                    <span style={{ color: user?.remainingQueries === -1 ? 'var(--color-success)' : 'var(--color-primary)' }}>
                                        {user?.remainingQueries === -1 ? '∞' : user?.remainingQueries}
                                    </span>
                                    <span style={{ fontSize: '0.9rem', color: 'var(--color-text-muted)', fontWeight: 'normal' }}> / {user?.maxQueries === -1 ? '∞' : user?.maxQueries}</span>
                                </div>
                            </div>
                            <div style={{ width: '1px', height: '30px', backgroundColor: 'var(--color-border)' }}></div>
                            <div className="stat-item">
                                <div style={{ fontSize: '0.8rem', color: 'var(--color-text-muted)', textTransform: 'uppercase', letterSpacing: '0.05em' }}>Plan</div>
                                <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
                                    <span style={{ fontWeight: 'bold', color: 'var(--color-text-main)' }}>{user?.subscriptionName}</span>
                                    <button
                                        onClick={() => setShowPlans(!showPlans)}
                                        className="btn btn-secondary"
                                        style={{ padding: '0.2rem 0.6rem', fontSize: '0.75rem', minHeight: 'auto' }}
                                    >
                                        Upgrade
                                    </button>
                                </div>
                            </div>
                        </div>
                    )}
                </div>

                {/* Subscription Plans Overlay/Section */}
                {showPlans && (
                    <div className="animate-fade-in" style={{ marginBottom: '3rem', padding: '2rem', background: 'white', borderRadius: '16px', border: '1px solid var(--color-border)' }}>
                        <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '2rem' }}>
                            <h3 style={{ fontSize: '1.5rem', fontWeight: 'bold', fontFamily: 'var(--font-heading)' }}>Choose Your Plan</h3>
                            <button onClick={() => setShowPlans(false)} className="btn btn-ghost">✕ Close</button>
                        </div>
                        <div className="grid-cards">
                            {subscriptions.map(sub => (
                                <div key={sub.sid} className="card" style={{
                                    padding: '2rem',
                                    border: user?.subscriptionName === sub.sName ? '2px solid var(--color-primary)' : '1px solid var(--color-border)',
                                    display: 'flex',
                                    flexDirection: 'column',
                                    position: 'relative',
                                    background: user?.subscriptionName === sub.sName ? '#FFF7ED' : 'white'
                                }}>
                                    {user?.subscriptionName === sub.sName && (
                                        <div style={{
                                            position: 'absolute', top: 0, right: 0, background: 'var(--color-primary)',
                                            color: 'white', padding: '4px 12px', fontSize: '0.75rem', fontWeight: 'bold',
                                            borderBottomLeftRadius: '16px'
                                        }}>CURRENT</div>
                                    )}
                                    <h4 style={{ fontSize: '1.5rem', marginBottom: '0.5rem', fontWeight: 'bold', color: 'var(--color-text-main)', fontFamily: 'var(--font-heading)' }}>{sub.sName}</h4>
                                    <div style={{ fontSize: '2.5rem', fontWeight: 'bold', marginBottom: '1.5rem', color: 'var(--color-primary)' }}>
                                        ₹{sub.fees}
                                        <span style={{ fontSize: '1rem', color: 'var(--color-text-muted)', fontWeight: 'normal' }}>/mo</span>
                                    </div>
                                    <ul style={{ listStyle: 'none', padding: 0, marginBottom: '2rem', flex: 1, display: 'flex', flexDirection: 'column', gap: '1rem' }}>
                                        <li style={{ color: 'var(--color-text-muted)', display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                                            <span style={{ color: 'var(--color-success)' }}>✓</span> {sub.queriesNu === -1 ? 'Unlimited' : sub.queriesNu} Queries/day
                                        </li>
                                        <li style={{ color: 'var(--color-text-muted)', display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                                            <span style={{ color: 'var(--color-success)' }}>✓</span> {sub.profileAllowed === -1 ? 'Unlimited' : sub.profileAllowed} Profile Views
                                        </li>
                                    </ul>
                                    <button
                                        className={`btn ${user?.subscriptionName === sub.sName ? 'btn-secondary' : 'btn-primary'}`}
                                        disabled={user?.subscriptionName === sub.sName}
                                        onClick={() => handleUpgrade(sub.sid)}
                                        style={{ width: '100%' }}
                                    >
                                        {user?.subscriptionName === sub.sName ? 'Active Plan' : 'Upgrade Now'}
                                    </button>
                                </div>
                            ))}
                        </div>
                    </div>
                )}

                {/* Main Content Switcher */}
                {activeTab === 'discover' && (
                    <>
                        {showResults ? (
                            <div className="animate-fade-in">
                                <div style={{ marginBottom: '2rem', display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                                    <button
                                        onClick={handleBackToSearch}
                                        className="btn btn-secondary"
                                        style={{ padding: '0.5rem 1rem' }}
                                    >
                                        ← Back to Search
                                    </button>
                                    <h3 style={{
                                        fontSize: '1.2rem',
                                        fontWeight: '700',
                                        color: 'var(--color-text-main)',
                                        fontFamily: 'var(--font-heading)',
                                        margin: 0
                                    }}>
                                        Found {matches.length} Matches
                                    </h3>
                                </div>

                                <div className="grid-cards">
                                    {matches.slice(0, visibleMatches).map((match, index) => (
                                        <MatchCard
                                            key={index}
                                            match={match}
                                            onViewProfile={handleViewProfile}
                                            onConnect={handleConnect}
                                        />
                                    ))}
                                </div>

                                <div style={{ textAlign: 'center', marginTop: '2rem', display: 'flex', justifyContent: 'center', gap: '1rem' }}>
                                    {matches.length > visibleMatches && (
                                        <button
                                            onClick={handleShowMore}
                                            className="btn btn-secondary"
                                            style={{ minWidth: '150px' }}
                                        >
                                            Show More
                                        </button>
                                    )}
                                    {visibleMatches > 10 && (
                                        <button
                                            onClick={handleShowLess}
                                            className="btn btn-ghost"
                                            style={{ minWidth: '150px' }}
                                        >
                                            Show Less
                                        </button>
                                    )}
                                </div>
                            </div>
                        ) : (
                            <div className="animate-fade-in">
                                <SearchFilters onSearch={handleSearch} loading={matchesLoading} />
                            </div>
                        )}
                    </>
                )}

                {activeTab === 'likes' && (
                    <div className="animate-fade-in">
                        {likedProfiles.length === 0 ? (
                            <div className="glass-panel" style={{ padding: '4rem', textAlign: 'center', display: 'flex', flexDirection: 'column', alignItems: 'center', background: 'white' }}>
                                <div style={{ fontSize: '4rem', marginBottom: '1rem' }}>💔</div>
                                <h3 style={{ marginBottom: '0.5rem', fontWeight: 'bold', fontSize: '1.5rem', color: 'var(--color-text-main)', fontFamily: 'var(--font-heading)' }}>No connections yet</h3>
                                <p style={{ color: 'var(--color-text-muted)', marginBottom: '2rem' }}>Start exploring and connect with people you like!</p>
                                <button onClick={() => setActiveTab('discover')} className="btn btn-primary">
                                    Start Exploring
                                </button>
                            </div>
                        ) : (
                            <div className="grid-cards">
                                {likedProfiles.map((match, index) => (
                                    <MatchCard
                                        key={index}
                                        match={match}
                                        onViewProfile={handleViewProfile}
                                        onRemove={initiateRemoveLike}
                                    />
                                ))}
                            </div>
                        )}
                    </div>
                )}

                {activeTab === 'profile' && (
                    <EditProfile
                        user={user}
                        onUpdate={(updatedUser) => {
                            setUser(updatedUser);
                            showToast('Profile updated successfully', 'success');
                        }}
                        onCancel={() => setActiveTab('discover')}
                    />
                )}

            </div>

            {/* Profile Modal */}
            <ProfileModal user={selectedProfile} onClose={handleCloseModal} />

            {/* Confirmation Modal */}
            <ConfirmationModal
                isOpen={confirmModal.isOpen}
                onClose={() => setConfirmModal({ isOpen: false, userId: null })}
                onConfirm={handleConfirmRemove}
                title="Remove Connection?"
                message="Are you sure you want to remove this profile from your likes? This action cannot be undone."
            />

            {/* Toast Notifications */}
            {toast && (
                <Toast
                    message={toast.message}
                    type={toast.type}
                    onClose={() => setToast(null)}
                />
            )}
        </div>
    );
};

export default Dashboard;
