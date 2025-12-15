import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

const Subscriptions = () => {
    const [subscriptions, setSubscriptions] = useState([]);
    const [loading, setLoading] = useState(true);
    const navigate = useNavigate();

    useEffect(() => {
        const fetchSubscriptions = async () => {
            try {
                const response = await fetch('/api/v1/subscriptions');
                if (response.ok) {
                    const data = await response.json();
                    setSubscriptions(data);
                }
            } catch (error) {
                console.error('Failed to fetch subscriptions', error);
            } finally {
                setLoading(false);
            }
        };

        fetchSubscriptions();
    }, []);

    if (loading) return <div style={{ paddingTop: '100px', textAlign: 'center', color: 'var(--color-text-muted)' }}>Loading...</div>;

    return (
        <div style={{ paddingTop: '120px', minHeight: '100vh', paddingBottom: '4rem', background: 'var(--color-bg)' }}>
            <div className="container animate-fade-in">
                <div style={{ textAlign: 'center', marginBottom: '4rem' }}>
                    <h2 style={{
                        fontSize: '3.5rem',
                        marginBottom: '1rem',
                        fontFamily: 'var(--font-heading)',
                        color: 'var(--color-text-main)',
                        fontWeight: '700',
                        letterSpacing: '-0.02em'
                    }}>
                        Choose Your Plan
                    </h2>
                    <p style={{ color: 'var(--color-text-muted)', fontSize: '1.2rem', maxWidth: '600px', margin: '0 auto', lineHeight: '1.6' }}>
                        Unlock premium features and find your perfect match faster with our tailored subscription plans.
                    </p>
                </div>

                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))', gap: '2.5rem' }}>
                    {subscriptions.map(sub => (
                        <div key={sub.sid} className="card" style={{
                            padding: '2.5rem',
                            display: 'flex',
                            flexDirection: 'column',
                            position: 'relative',
                            overflow: 'hidden',
                            border: sub.sName === 'PLATINUM' ? '2px solid var(--color-primary)' : '1px solid var(--color-border)',
                            transform: sub.sName === 'PLATINUM' ? 'scale(1.05)' : 'scale(1)',
                            zIndex: sub.sName === 'PLATINUM' ? 10 : 1,
                            background: sub.sName === 'PLATINUM' ? '#FFF7ED' : 'white',
                            boxShadow: sub.sName === 'PLATINUM' ? 'var(--shadow-lg)' : 'var(--shadow-md)'
                        }}>
                            {sub.sName === 'PLATINUM' && (
                                <div style={{
                                    position: 'absolute', top: 0, right: 0, background: 'var(--color-primary)',
                                    color: 'white', padding: '0.5rem 1.5rem', fontSize: '0.8rem', fontWeight: 'bold',
                                    borderBottomLeftRadius: '16px',
                                    letterSpacing: '0.05em'
                                }}>POPULAR</div>
                            )}

                            <h4 style={{
                                fontSize: '1.75rem',
                                marginBottom: '0.5rem',
                                color: 'var(--color-text-main)',
                                fontFamily: 'var(--font-heading)',
                                fontWeight: '700'
                            }}>{sub.sName}</h4>

                            <div style={{ fontSize: '3rem', fontWeight: '700', marginBottom: '2rem', color: 'var(--color-primary)' }}>
                                ${sub.fees}
                                <span style={{ fontSize: '1rem', color: 'var(--color-text-muted)', fontWeight: 'normal' }}>/mo</span>
                            </div>

                            <ul style={{ listStyle: 'none', padding: 0, marginBottom: '2.5rem', flex: 1, display: 'flex', flexDirection: 'column', gap: '1rem' }}>
                                <li style={{ color: 'var(--color-text-muted)', display: 'flex', alignItems: 'center', gap: '0.75rem', fontSize: '1.1rem' }}>
                                    <span style={{ color: 'var(--color-success)', fontSize: '1.2rem' }}>✓</span>
                                    {sub.queriesNu === -1 ? 'Unlimited' : sub.queriesNu} Queries/day
                                </li>
                                <li style={{ color: 'var(--color-text-muted)', display: 'flex', alignItems: 'center', gap: '0.75rem', fontSize: '1.1rem' }}>
                                    <span style={{ color: 'var(--color-success)', fontSize: '1.2rem' }}>✓</span>
                                    {sub.profileAllowed === -1 ? 'Unlimited' : sub.profileAllowed} Profile Views
                                </li>
                                <li style={{ color: 'var(--color-text-muted)', display: 'flex', alignItems: 'center', gap: '0.75rem', fontSize: '1.1rem' }}>
                                    <span style={{ color: 'var(--color-success)', fontSize: '1.2rem' }}>✓</span>
                                    Priority Support
                                </li>
                            </ul>

                            <button
                                className={sub.sName === 'PLATINUM' ? 'btn btn-primary' : 'btn btn-secondary'}
                                onClick={() => navigate('/login')}
                                style={{ width: '100%', padding: '1rem', fontSize: '1.1rem' }}
                            >
                                Get Started
                            </button>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
};

export default Subscriptions;
