import React from 'react';
import { Link } from 'react-router-dom';

const Home = () => {
    return (
        <div style={{ paddingTop: '100px', minHeight: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center', textAlign: 'center' }}>
            <div className="container animate-fade-in">
                <h1 style={{ fontSize: '4rem', marginBottom: '1.5rem', lineHeight: 1.1 }}>
                    Find Your <span className="text-gradient">Soul Connection</span>
                </h1>
                <p style={{ fontSize: '1.25rem', color: 'var(--color-text-muted)', marginBottom: '3rem', maxWidth: '600px', margin: '0 auto 3rem' }}>
                    Experience meaningful connections with our premium matchmaking service.
                    Secure, private, and tailored just for you.
                </p>

                <div style={{ display: 'flex', gap: '1rem', justifyContent: 'center' }}>
                    <Link to="/signup" className="btn btn-primary" style={{ fontSize: '1.2rem', padding: '1rem 2.5rem', textDecoration: 'none' }}>
                        Start Your Journey
                    </Link>
                    <Link to="/login" className="btn btn-outline" style={{ fontSize: '1.2rem', padding: '1rem 2.5rem', textDecoration: 'none' }}>
                        Login
                    </Link>
                </div>

                <div style={{ marginTop: '5rem', display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))', gap: '2rem' }}>
                    <div className="glass-panel" style={{ padding: '2rem' }}>
                        <h3 style={{ marginBottom: '1rem', color: 'var(--color-accent)' }}>Smart Matching</h3>
                        <p style={{ color: 'var(--color-text-muted)' }}>AI-driven algorithms to find your perfect match based on deep compatibility.</p>
                    </div>
                    <div className="glass-panel" style={{ padding: '2rem' }}>
                        <h3 style={{ marginBottom: '1rem', color: 'var(--color-secondary)' }}>Premium Privacy</h3>
                        <p style={{ color: 'var(--color-text-muted)' }}>Your data is encrypted and secure. You control who sees your profile.</p>
                    </div>
                    <div className="glass-panel" style={{ padding: '2rem' }}>
                        <h3 style={{ marginBottom: '1rem', color: 'var(--color-primary)' }}>Verified Profiles</h3>
                        <p style={{ color: 'var(--color-text-muted)' }}>Every profile is manually verified to ensure a safe and authentic community.</p>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default Home;
