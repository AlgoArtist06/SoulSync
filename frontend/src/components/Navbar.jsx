import React from 'react';
import { Link, useLocation } from 'react-router-dom';

const Navbar = () => {
    const [isLoggedIn, setIsLoggedIn] = React.useState(() => {
        return !!localStorage.getItem('token');
    });
    const location = useLocation();

    React.useEffect(() => {
        const token = localStorage.getItem('token');
        setIsLoggedIn(!!token);
    }, [location]);

    const handleLogout = () => {
        localStorage.removeItem('token');
        localStorage.removeItem('userId');
        setIsLoggedIn(false);
        window.location.href = '/login';
    };

    if (location.pathname === '/dashboard') return null;

    return (
        <nav className="glass-panel" style={{
            position: 'fixed',
            top: '1rem',
            left: '50%',
            transform: 'translateX(-50%)',
            width: '90%',
            maxWidth: '1200px',
            padding: '0.75rem 2rem',
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            zIndex: 1000,
            borderRadius: '9999px',
            background: 'rgba(255, 255, 255, 0.9)',
            border: '1px solid rgba(255, 255, 255, 0.8)'
        }}>
            <Link to="/" style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                <div className="neon-avatar" style={{
                    width: '36px',
                    height: '36px',
                    fontSize: '1.2rem',
                    background: 'var(--color-primary)',
                    color: 'white',
                    border: 'none',
                    boxShadow: 'none'
                }}>S</div>
                <h1 style={{
                    margin: 0,
                    fontSize: '1.5rem',
                    fontWeight: '700',
                    fontFamily: 'var(--font-heading)',
                    color: 'var(--color-text-main)',
                    letterSpacing: '-0.02em'
                }}>SoulSync</h1>
            </Link>

            <div style={{ display: 'flex', gap: '2rem', alignItems: 'center' }}>
                {isLoggedIn ? (
                    <>
                        <Link
                            to="/dashboard"
                            style={{
                                color: location.pathname === '/dashboard' ? 'var(--color-primary)' : 'var(--color-text-muted)',
                                fontWeight: '600',
                                transition: 'color 0.2s',
                                fontSize: '0.95rem'
                            }}
                        >
                            Dashboard
                        </Link>
                        <button
                            onClick={handleLogout}
                            className="btn btn-secondary"
                            style={{ padding: '0.5rem 1.25rem', fontSize: '0.875rem' }}
                        >
                            Logout
                        </button>
                    </>
                ) : (
                    <>
                        <Link
                            to="/"
                            style={{
                                color: location.pathname === '/' ? 'var(--color-primary)' : 'var(--color-text-muted)',
                                fontWeight: '600',
                                fontSize: '0.95rem'
                            }}
                        >
                            Home
                        </Link>
                        <Link
                            to="/subscriptions"
                            style={{
                                color: location.pathname === '/subscriptions' ? 'var(--color-primary)' : 'var(--color-text-muted)',
                                fontWeight: '600',
                                fontSize: '0.95rem'
                            }}
                        >
                            Plans
                        </Link>
                        <Link
                            to="/login"
                            style={{ color: 'var(--color-text-main)', fontWeight: '600', fontSize: '0.95rem' }}
                        >
                            Login
                        </Link>
                        <Link to="/signup" className="btn btn-primary" style={{ padding: '0.5rem 1.5rem', fontSize: '0.875rem' }}>
                            Get Started
                        </Link>
                    </>
                )}
            </div>
        </nav>
    );
};

export default Navbar;
