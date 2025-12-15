import React, { useState } from 'react';
import { Link } from 'react-router-dom';

const AuthForm = ({ title, type, onSubmit, error }) => {
    const [formData, setFormData] = useState({
        email: '',
        password: '',
        name: ''
    });

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        onSubmit(formData);
    };

    return (
        <div style={{
            minHeight: '100vh',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            paddingTop: '60px',
            background: 'var(--color-bg)'
        }}>
            <div className="card animate-fade-in" style={{
                padding: '3rem',
                width: '100%',
                maxWidth: '450px',
                display: 'flex',
                flexDirection: 'column',
                gap: '1.5rem',
                background: 'white',
                boxShadow: 'var(--shadow-lg)'
            }}>
                <h2 style={{
                    textAlign: 'center',
                    fontSize: '2.5rem',
                    marginBottom: '1rem',
                    fontFamily: 'var(--font-heading)',
                    color: 'var(--color-text-main)',
                    fontWeight: '700'
                }}>
                    {title} <span style={{ color: 'var(--color-primary)' }}>SoulSync</span>
                </h2>

                {error && (
                    <div style={{
                        padding: '1rem',
                        background: '#FEF2F2',
                        border: '1px solid #FECACA',
                        borderRadius: 'var(--radius-sm)',
                        color: 'var(--color-error)',
                        fontSize: '0.9rem'
                    }}>
                        {error}
                    </div>
                )}

                <form onSubmit={handleSubmit} style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
                    {type === 'signup' && (
                        <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
                            <label style={{ color: 'var(--color-text-main)', fontSize: '0.95rem', fontWeight: '500' }}>Full Name</label>
                            <input
                                type="text"
                                name="name"
                                value={formData.name}
                                onChange={handleChange}
                                required
                                style={{
                                    background: 'white',
                                    border: '1px solid var(--color-border)',
                                    padding: '0.875rem',
                                    borderRadius: 'var(--radius-sm)',
                                    color: 'var(--color-text-main)',
                                    outline: 'none'
                                }}
                            />
                        </div>
                    )}

                    <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
                        <label style={{ color: 'var(--color-text-main)', fontSize: '0.95rem', fontWeight: '500' }}>Email Address</label>
                        <input
                            type="email"
                            name="email"
                            value={formData.email}
                            onChange={handleChange}
                            required
                            style={{
                                background: 'white',
                                border: '1px solid var(--color-border)',
                                padding: '0.875rem',
                                borderRadius: 'var(--radius-sm)',
                                color: 'var(--color-text-main)',
                                outline: 'none'
                            }}
                        />
                    </div>

                    <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
                        <label style={{ color: 'var(--color-text-main)', fontSize: '0.95rem', fontWeight: '500' }}>Password</label>
                        <input
                            type="password"
                            name="password"
                            value={formData.password}
                            onChange={handleChange}
                            required
                            style={{
                                background: 'white',
                                border: '1px solid var(--color-border)',
                                padding: '0.875rem',
                                borderRadius: 'var(--radius-sm)',
                                color: 'var(--color-text-main)',
                                outline: 'none'
                            }}
                        />
                    </div>

                    <button type="submit" className="btn btn-primary" style={{ marginTop: '1rem', width: '100%', fontSize: '1rem', padding: '1rem' }}>
                        {type === 'login' ? 'Sign In' : 'Create Account'}
                    </button>
                </form>

                <div style={{ textAlign: 'center', color: 'var(--color-text-muted)', fontSize: '0.95rem' }}>
                    {type === 'login' ? (
                        <>
                            Don't have an account? <Link to="/signup" style={{ color: 'var(--color-primary)', fontWeight: '600' }}>Sign up</Link>
                        </>
                    ) : (
                        <>
                            Already have an account? <Link to="/login" style={{ color: 'var(--color-primary)', fontWeight: '600' }}>Log in</Link>
                        </>
                    )}
                </div>
            </div>
        </div>
    );
};

export default AuthForm;
