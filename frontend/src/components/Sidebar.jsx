import React from 'react';
import { useNavigate } from 'react-router-dom';

const Sidebar = ({ user, activeTab, setActiveTab, onLogout }) => {
    const navigate = useNavigate();

    const menuItems = [
        { id: 'discover', label: 'Discover', icon: '🔍' },
        { id: 'likes', label: 'My Likes', icon: '❤️' },
        { id: 'profile', label: 'My Profile', icon: '👤' },
    ];

    return (
        <div className="sidebar glass-panel" style={{
            width: '280px',
            height: '100vh',
            position: 'fixed',
            left: 0,
            top: 0,
            display: 'flex',
            flexDirection: 'column',
            padding: '2rem',
            borderRight: '1px solid var(--color-border)',
            background: 'rgba(255, 255, 255, 0.95)', // Solid-ish background for clarity
            zIndex: 1000
        }}>
            {/* Logo Area */}
            <div style={{ marginBottom: '3rem', textAlign: 'center' }}>
                <h1 style={{
                    fontFamily: 'var(--font-heading)',
                    fontSize: '2rem',
                    color: 'var(--color-primary)',
                    margin: 0,
                    fontWeight: 'bold'
                }}>
                    SoulSync
                </h1>
                <p style={{ fontSize: '0.8rem', color: 'var(--color-text-muted)', letterSpacing: '0.1em', textTransform: 'uppercase' }}>
                    Find Your One
                </p>
            </div>

            {/* Navigation */}
            <nav style={{ flex: 1, display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
                {menuItems.map(item => (
                    <button
                        key={item.id}
                        onClick={() => setActiveTab(item.id)}
                        style={{
                            display: 'flex',
                            alignItems: 'center',
                            gap: '1rem',
                            padding: '1rem 1.5rem',
                            border: 'none',
                            background: activeTab === item.id ? 'var(--color-bg)' : 'transparent',
                            color: activeTab === item.id ? 'var(--color-primary)' : 'var(--color-text-main)',
                            borderRadius: '12px',
                            cursor: 'pointer',
                            fontSize: '1rem',
                            fontWeight: activeTab === item.id ? '600' : '400',
                            transition: 'all 0.2s ease',
                            textAlign: 'left',
                            width: '100%'
                        }}
                    >
                        <span style={{ fontSize: '1.2rem' }}>{item.icon}</span>
                        {item.label}
                    </button>
                ))}
            </nav>

            {/* User Mini Profile & Logout */}
            <div style={{
                marginTop: 'auto',
                paddingTop: '1.5rem',
                borderTop: '1px solid var(--color-border)',
                display: 'flex',
                flexDirection: 'column',
                gap: '1rem'
            }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
                    <div style={{
                        width: '40px',
                        height: '40px',
                        borderRadius: '50%',
                        background: 'linear-gradient(135deg, var(--color-primary), var(--color-accent))',
                        color: 'white',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        fontWeight: 'bold',
                        fontSize: '1.2rem'
                    }}>
                        {user?.firstName?.charAt(0) || 'U'}
                    </div>
                    <div style={{ overflow: 'hidden' }}>
                        <div style={{ fontWeight: 'bold', color: 'var(--color-text-main)', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}>
                            {user?.firstName} {user?.lastName}
                        </div>
                        <div style={{ fontSize: '0.8rem', color: 'var(--color-text-muted)' }}>
                            {user?.subscriptionName || 'Free Plan'}
                        </div>
                    </div>
                </div>

                <button
                    onClick={onLogout}
                    style={{
                        padding: '0.8rem',
                        border: '1px solid var(--color-border)',
                        background: 'transparent',
                        color: 'var(--color-text-muted)',
                        borderRadius: '8px',
                        cursor: 'pointer',
                        fontSize: '0.9rem',
                        transition: 'all 0.2s',
                        width: '100%'
                    }}
                    onMouseOver={(e) => { e.target.style.borderColor = 'var(--color-primary)'; e.target.style.color = 'var(--color-primary)'; }}
                    onMouseOut={(e) => { e.target.style.borderColor = 'var(--color-border)'; e.target.style.color = 'var(--color-text-muted)'; }}
                >
                    Sign Out
                </button>
            </div>
        </div>
    );
};

export default Sidebar;
