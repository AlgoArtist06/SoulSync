import React from 'react';

const MatchCard = ({ match, onViewProfile, onConnect, onRemove }) => {
    const initials = `${match.firstName?.charAt(0) || ''}${match.lastName?.charAt(0) || ''}`;

    // Generate a deterministic warm/elegant gradient based on the user's name/ID
    const getGradient = (id) => {
        const gradients = [
            'linear-gradient(135deg, #FFE4E6, #FECDD3)', // Soft Rose
            'linear-gradient(135deg, #FCE7F3, #FBCFE8)', // Soft Pink
            'linear-gradient(135deg, #FAE8FF, #E9D5FF)', // Soft Lavender
            'linear-gradient(135deg, #FFF1F2, #FFE4E6)', // Rose White
            'linear-gradient(135deg, #FEF3C7, #FDE68A)', // Soft Gold
            'linear-gradient(135deg, #E0E7FF, #C7D2FE)', // Soft Periwinkle
        ];

        const index = (id || 0) % gradients.length;
        return gradients[index];
    };

    const cardGradient = getGradient(match.userId || match.id || match.firstName?.length);

    return (
        <div className="card" style={{ display: 'flex', flexDirection: 'column', height: '100%' }}>
            <div style={{
                height: '160px',
                position: 'relative',
                borderBottom: '1px solid var(--color-border)'
            }}>
                <div className="neon-hero" style={{ background: cardGradient }}>
                    <span className="neon-hero-text" style={{
                        color: 'rgba(255,255,255,0.8)',
                        fontSize: '3rem',
                        fontFamily: 'var(--font-heading)'
                    }}>
                        {initials}
                    </span>
                </div>

                <div style={{
                    position: 'absolute',
                    bottom: 0,
                    left: 0,
                    right: 0,
                    padding: 'var(--space-2)',
                    background: 'linear-gradient(to top, rgba(255,255,255,0.95), rgba(255,255,255,0))',
                    color: 'var(--color-text-main)'
                }}>
                    <h3 style={{ margin: 0, fontSize: '1.25rem', fontWeight: '700', fontFamily: 'var(--font-heading)' }}>
                        {match.firstName}, {match.age}
                    </h3>
                </div>
            </div>

            <div style={{ padding: 'var(--space-2)', flex: 1, display: 'flex', flexDirection: 'column', background: 'var(--color-surface)' }}>
                <div style={{ marginBottom: '0.75rem', flex: 1 }}>
                    <p style={{ color: 'var(--color-text-muted)', marginBottom: '0.75rem', fontSize: '0.9rem', fontWeight: '500' }}>
                        {match.occupation || 'Software Engineer'}
                    </p>
                    <div style={{ display: 'flex', gap: '0.4rem', flexWrap: 'wrap' }}>
                        {match.caste && (
                            <span style={{
                                background: '#F1F5F9',
                                padding: '4px 8px',
                                borderRadius: '20px',
                                fontSize: '0.7rem',
                                color: 'var(--color-text-muted)',
                                fontWeight: '500'
                            }}>
                                {match.caste}
                            </span>
                        )}
                        {match.religion && (
                            <span style={{
                                background: '#FFF7ED',
                                padding: '4px 8px',
                                borderRadius: '20px',
                                fontSize: '0.7rem',
                                color: 'var(--color-primary)',
                                fontWeight: '500'
                            }}>
                                {match.religion}
                            </span>
                        )}
                    </div>
                </div>

                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '0.75rem', paddingTop: '1rem', borderTop: '1px solid var(--color-border)' }}>
                    <button
                        onClick={() => onViewProfile(match)}
                        className="btn btn-secondary"
                        style={{ width: '100%', justifyContent: 'center' }}
                    >
                        View Profile
                    </button>
                    {onConnect && (
                        <button
                            onClick={() => onConnect(match.userId)}
                            className="btn btn-primary"
                            style={{ width: '100%', justifyContent: 'center' }}
                        >
                            Connect
                        </button>
                    )}
                    {onRemove && (
                        <button
                            onClick={() => onRemove(match.userId)}
                            className="btn btn-secondary"
                            style={{
                                width: '100%',
                                justifyContent: 'center',
                                color: 'var(--color-error)',
                                borderColor: 'rgba(220, 38, 38, 0.2)',
                                background: '#FEF2F2'
                            }}
                        >
                            Remove
                        </button>
                    )}
                </div>
            </div>
        </div>
    );
};

export default MatchCard;
