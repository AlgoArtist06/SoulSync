import React, { useEffect } from 'react';

const Toast = ({ message, type = 'info', duration = 3000, onClose }) => {
    useEffect(() => {
        if (duration > 0) {
            const timer = setTimeout(() => {
                onClose();
            }, duration);
            return () => clearTimeout(timer);
        }
    }, [duration, onClose]);

    const getTypeStyles = () => {
        switch (type) {
            case 'success':
                return {
                    background: 'linear-gradient(135deg, #10B981, #059669)',
                    icon: '✓'
                };
            case 'error':
                return {
                    background: 'linear-gradient(135deg, #EF4444, #B91C1C)',
                    icon: '✕'
                };
            case 'warning':
                return {
                    background: 'linear-gradient(135deg, #F59E0B, #D97706)',
                    icon: '⚠'
                };
            default: // info
                return {
                    background: 'linear-gradient(135deg, #8B5CF6, #7C3AED)',
                    icon: 'ℹ'
                };
        }
    };

    const styles = getTypeStyles();

    return (
        <div style={{
            position: 'fixed',
            bottom: '2rem',
            right: '2rem',
            zIndex: 9999,
            animation: 'slideInRight 0.3s ease-out',
            maxWidth: '400px'
        }}>
            <div style={{
                background: 'rgba(30, 41, 59, 0.9)',
                backdropFilter: 'blur(10px)',
                border: '1px solid rgba(255, 255, 255, 0.1)',
                borderRadius: '16px',
                padding: '1rem 1.5rem',
                boxShadow: '0 10px 30px rgba(0, 0, 0, 0.5)',
                display: 'flex',
                alignItems: 'center',
                gap: '1rem',
                color: 'white'
            }}>
                <div style={{
                    width: '32px',
                    height: '32px',
                    borderRadius: '50%',
                    background: styles.background,
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    fontWeight: 'bold',
                    boxShadow: '0 0 10px rgba(0,0,0,0.3)'
                }}>
                    {styles.icon}
                </div>
                <div style={{
                    flex: 1,
                    fontSize: '0.95rem',
                    fontWeight: '500'
                }}>
                    {message}
                </div>
                <button
                    onClick={onClose}
                    style={{
                        background: 'transparent',
                        border: 'none',
                        color: 'rgba(255, 255, 255, 0.5)',
                        cursor: 'pointer',
                        fontSize: '1.25rem',
                        padding: 0,
                        lineHeight: 1,
                        transition: 'color 0.2s'
                    }}
                >
                    ×
                </button>
            </div>
            <style>{`
                @keyframes slideInRight {
                    from { transform: translateX(100%); opacity: 0; }
                    to { transform: translateX(0); opacity: 1; }
                }
            `}</style>
        </div>
    );
};

export default Toast;
