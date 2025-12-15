import React from 'react';

const ProfileModal = ({ user, onClose }) => {
    if (!user) return null;

    const initials = `${user.firstName?.charAt(0) || ''}${user.lastName?.charAt(0) || ''}`;

    const getReligionEmoji = (religion) => {
        switch (religion) {
            case 'Hindu': return '🕉️';
            case 'Muslim': return '☪️';
            case 'Christian': return '✝️';
            case 'Sikh': return '☬';
            case 'Buddhist': return '☸️';
            case 'Jain': return '☸️';
            default: return '🙏';
        }
    };

    return (
        <div className="modal-overlay" onClick={onClose}>
            <div className="modal-content" onClick={e => e.stopPropagation()} style={{ maxWidth: '420px', padding: 'var(--space-3)' }}>
                <button className="modal-close-btn" onClick={onClose}>×</button>

                <div style={{ textAlign: 'center', marginBottom: 'var(--space-3)' }}>
                    <div className="neon-avatar" style={{
                        width: '80px',
                        height: '80px',
                        fontSize: '2rem',
                        margin: '0 auto var(--space-2) auto',
                        background: 'linear-gradient(135deg, #FFE4E6, #FECDD3)',
                        color: 'var(--color-primary)',
                        border: '3px solid white',
                        boxShadow: 'var(--shadow-md)'
                    }}>
                        {initials}
                    </div>
                    <h2 style={{
                        fontSize: '1.75rem',
                        marginBottom: '0.25rem',
                        fontWeight: '700',
                        fontFamily: 'var(--font-heading)',
                        color: 'var(--color-text-main)'
                    }}>
                        {user.firstName} {user.lastName}
                    </h2>
                    <p style={{ color: 'var(--color-text-muted)', fontSize: '1rem' }}>{user.age} years old • {user.occupation}</p>
                </div>

                <div style={{
                    display: 'grid',
                    gridTemplateColumns: '1fr 1fr',
                    gap: 'var(--space-2)'
                }}>
                    <DetailItem label="Occupation" value={user.occupation} icon="💼" />
                    <DetailItem label="Education" value={user.education} icon="🎓" />
                    <DetailItem
                        label="Income"
                        value={user.monthlyIncome ? `₹${user.monthlyIncome.toLocaleString()}` : null}
                        icon="💰"
                    />
                    <DetailItem label="Height" value={user.height ? `${user.height} cm` : null} icon="📏" />
                    <DetailItem
                        label="Religion"
                        value={user.religion}
                        icon={getReligionEmoji(user.religion)}
                    />
                    <DetailItem label="Caste" value={user.caste} icon="📿" />
                    <DetailItem label="Date of Birth" value={user.dob} icon="🎂" />
                    <DetailItem label="Gender" value={user.gender} icon={user.gender === 'Male' ? '👨' : '👩'} />
                </div>
            </div>
        </div>
    );
};

const DetailItem = ({ label, value, icon }) => {
    if (!value) return null;
    return (
        <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '0.75rem',
            padding: '0.75rem',
            background: '#F8FAFC',
            borderRadius: 'var(--radius-md)',
            border: '1px solid var(--color-border)',
            transition: 'transform 0.2s ease',
            boxShadow: 'var(--shadow-sm)'
        }}>
            <span style={{ fontSize: '1.25rem' }}>{icon}</span>
            <div>
                <div style={{ fontSize: '0.75rem', color: 'var(--color-text-muted)', marginBottom: '1px', textTransform: 'uppercase', letterSpacing: '0.05em' }}>{label}</div>
                <div style={{ fontWeight: '600', fontSize: '0.9rem', color: 'var(--color-text-main)' }}>{value}</div>
            </div>
        </div>
    );
};

export default ProfileModal;
