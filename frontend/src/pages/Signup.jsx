import React, { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';

const Signup = () => {
    const navigate = useNavigate();
    const [error, setError] = useState('');
    const [loading, setLoading] = useState(false);

    const [formData, setFormData] = useState({
        email: '',
        password: '',
        firstName: '',
        lastName: '',
        dob: '',
        gender: '',
        education: '',
        monthlyIncome: '',
        height: '',
        occupation: '',
        religion: '',
        caste: ''
    });

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({
            ...prev,
            [name]: value
        }));
    };

    const handleSignup = async (e) => {
        e.preventDefault();
        setError('');
        setLoading(true);

        try {
            // Convert numeric fields
            const payload = {
                ...formData,
                monthlyIncome: formData.monthlyIncome ? parseFloat(formData.monthlyIncome) : null,
                height: formData.height ? parseFloat(formData.height) : null
            };

            const response = await fetch('/api/v1/auth/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(payload),
            });

            const data = await response.json();

            if (!response.ok) {
                throw new Error(data.message || 'Registration failed');
            }

            // Auto login or redirect to login? 
            // The backend returns UserResponse, not a token directly in register usually, 
            // but let's check AuthController. 
            // AuthController.registerUser returns UserResponse (201). 
            // So we should redirect to login.

            navigate('/login');
        } catch (err) {
            setError(err.message || 'Signup failed');
        } finally {
            setLoading(false);
        }
    };

    return (
        <div style={{
            minHeight: '100vh',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            paddingTop: '80px',
            paddingBottom: '40px'
        }}>
            <div className="glass-panel animate-fade-in" style={{
                padding: '3rem',
                width: '100%',
                maxWidth: '800px', // Wider for more fields
            }}>
                <h2 style={{ textAlign: 'center', fontSize: '2rem', marginBottom: '2rem' }}>
                    Join <span className="text-gradient">SoulSync</span>
                </h2>

                {error && (
                    <div style={{
                        padding: '1rem',
                        marginBottom: '1.5rem',
                        background: 'rgba(239, 68, 68, 0.2)',
                        border: '1px solid rgba(239, 68, 68, 0.5)',
                        borderRadius: '8px',
                        color: '#fca5a5',
                        textAlign: 'center'
                    }}>
                        {error}
                    </div>
                )}

                <form onSubmit={handleSignup} style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1.5rem' }}>

                    {/* Account Info */}
                    <div style={{ gridColumn: '1 / -1' }}>
                        <h3 style={{ color: 'var(--color-primary)', marginBottom: '1rem', borderBottom: '1px solid var(--color-border)', paddingBottom: '0.5rem' }}>Account Details</h3>
                    </div>

                    <div className="form-group">
                        <label>Email *</label>
                        <input type="email" name="email" value={formData.email} onChange={handleChange} required />
                    </div>
                    <div className="form-group">
                        <label>Password *</label>
                        <input type="password" name="password" value={formData.password} onChange={handleChange} required minLength="8" />
                    </div>

                    {/* Personal Info */}
                    <div style={{ gridColumn: '1 / -1', marginTop: '1rem' }}>
                        <h3 style={{ color: 'var(--color-primary)', marginBottom: '1rem', borderBottom: '1px solid var(--color-border)', paddingBottom: '0.5rem' }}>Personal Details</h3>
                    </div>

                    <div className="form-group">
                        <label>First Name *</label>
                        <input type="text" name="firstName" value={formData.firstName} onChange={handleChange} required />
                    </div>
                    <div className="form-group">
                        <label>Last Name *</label>
                        <input type="text" name="lastName" value={formData.lastName} onChange={handleChange} required />
                    </div>

                    <div className="form-group">
                        <label>Date of Birth *</label>
                        <input type="date" name="dob" value={formData.dob} onChange={handleChange} required />
                    </div>
                    <div className="form-group">
                        <label>Gender *</label>
                        <select name="gender" value={formData.gender} onChange={handleChange} required>
                            <option value="">Select Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <div className="form-group">
                        <label>Height (cm)</label>
                        <input type="number" name="height" value={formData.height} onChange={handleChange} step="0.01" />
                    </div>
                    <div className="form-group">
                        <label>Religion</label>
                        <input type="text" name="religion" value={formData.religion} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <label>Caste</label>
                        <input type="text" name="caste" value={formData.caste} onChange={handleChange} />
                    </div>

                    {/* Professional Info */}
                    <div style={{ gridColumn: '1 / -1', marginTop: '1rem' }}>
                        <h3 style={{ color: 'var(--color-primary)', marginBottom: '1rem', borderBottom: '1px solid var(--color-border)', paddingBottom: '0.5rem' }}>Professional Details</h3>
                    </div>

                    <div className="form-group">
                        <label>Education</label>
                        <input type="text" name="education" value={formData.education} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <label>Occupation</label>
                        <input type="text" name="occupation" value={formData.occupation} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <label>Monthly Income</label>
                        <input type="number" name="monthlyIncome" value={formData.monthlyIncome} onChange={handleChange} />
                    </div>

                    <div style={{ gridColumn: '1 / -1', marginTop: '1rem' }}>
                        <button type="submit" className="btn btn-primary" style={{ width: '100%' }} disabled={loading}>
                            {loading ? 'Creating Account...' : 'Register'}
                        </button>
                    </div>
                </form>

                <div style={{ textAlign: 'center', marginTop: '1.5rem', color: 'var(--color-text-muted)' }}>
                    Already have an account? <Link to="/login" style={{ color: 'var(--color-primary)' }}>Log in</Link>
                </div>
            </div>

            <style>{`
                .form-group {
                    display: flex;
                    flex-direction: column;
                    gap: 0.5rem;
                }
                .form-group label {
                    font-size: 0.9rem;
                    color: var(--color-text-main);
                    font-weight: 500;
                }
                .form-group input, .form-group select {
                    background: var(--color-bg);
                    border: 1px solid var(--color-border);
                    padding: 0.8rem;
                    border-radius: 8px;
                    color: var(--color-text-main);
                    outline: none;
                    width: 100%;
                    transition: all 0.2s;
                }
                .form-group input:focus, .form-group select:focus {
                    border-color: var(--color-primary);
                    box-shadow: 0 0 0 3px rgba(225, 29, 72, 0.1);
                }
                option {
                    background: white;
                    color: var(--color-text-main);
                }
            `}</style>
        </div>
    );
};

export default Signup;
