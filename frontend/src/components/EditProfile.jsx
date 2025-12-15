import React, { useState, useEffect } from 'react';

const EditProfile = ({ user, onUpdate, onCancel }) => {
    const [formData, setFormData] = useState({
        firstName: '',
        lastName: '',
        email: '', // Read-only usually, but DTO has it
        dob: '',
        gender: '',
        height: '',
        religion: '',
        caste: '',
        education: '',
        occupation: '',
        monthlyIncome: ''
    });
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState('');
    const [success, setSuccess] = useState('');

    useEffect(() => {
        if (user) {
            setFormData({
                firstName: user.firstName || '',
                lastName: user.lastName || '',
                email: user.email || '',
                dob: user.dob || '',
                gender: user.gender || '',
                height: user.height || '',
                religion: user.religion || '',
                caste: user.caste || '',
                education: user.education || '',
                occupation: user.occupation || '',
                monthlyIncome: user.monthlyIncome || ''
            });
        }
    }, [user]);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({
            ...prev,
            [name]: value
        }));
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setLoading(true);
        setError('');
        setSuccess('');

        try {
            const token = localStorage.getItem('token');
            const response = await fetch('/api/v1/users/profile', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}`
                },
                body: JSON.stringify(formData)
            });

            if (!response.ok) {
                const data = await response.json();
                throw new Error(data.message || 'Failed to update profile');
            }

            const updatedUser = await response.json();
            setSuccess('Profile updated successfully!');
            if (onUpdate) onUpdate(updatedUser);

            // Optional: Auto-close after success?
            // setTimeout(() => onCancel(), 1500); 
        } catch (err) {
            setError(err.message);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="glass-panel animate-fade-in" style={{ padding: '2rem', maxWidth: '800px', margin: '0 auto', background: 'white' }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '2rem' }}>
                <h2 style={{ fontSize: '1.8rem', fontWeight: 'bold', color: 'var(--color-text-main)', fontFamily: 'var(--font-heading)', margin: 0 }}>
                    Edit Profile
                </h2>
                <button onClick={onCancel} className="btn btn-ghost" style={{ padding: '0.5rem' }}>✕</button>
            </div>

            {error && (
                <div style={{ padding: '1rem', marginBottom: '1.5rem', background: '#FEF2F2', border: '1px solid #FECACA', borderRadius: '8px', color: '#DC2626' }}>
                    {error}
                </div>
            )}

            {success && (
                <div style={{ padding: '1rem', marginBottom: '1.5rem', background: '#ECFDF5', border: '1px solid #A7F3D0', borderRadius: '8px', color: '#059669' }}>
                    {success}
                </div>
            )}

            <form onSubmit={handleSubmit} style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1.5rem' }}>

                {/* Personal Details */}
                <div style={{ gridColumn: '1 / -1' }}>
                    <h3 style={{ fontSize: '1.1rem', color: 'var(--color-primary)', borderBottom: '1px solid var(--color-border)', paddingBottom: '0.5rem', marginBottom: '1rem' }}>Personal Details</h3>
                </div>

                <div className="form-group">
                    <label>First Name</label>
                    <input type="text" name="firstName" value={formData.firstName} onChange={handleChange} required />
                </div>
                <div className="form-group">
                    <label>Last Name</label>
                    <input type="text" name="lastName" value={formData.lastName} onChange={handleChange} required />
                </div>
                <div className="form-group">
                    <label>Date of Birth</label>
                    <input type="date" name="dob" value={formData.dob} onChange={handleChange} required />
                </div>
                <div className="form-group">
                    <label>Gender</label>
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

                {/* Professional Details */}
                <div style={{ gridColumn: '1 / -1', marginTop: '1rem' }}>
                    <h3 style={{ fontSize: '1.1rem', color: 'var(--color-primary)', borderBottom: '1px solid var(--color-border)', paddingBottom: '0.5rem', marginBottom: '1rem' }}>Professional Details</h3>
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
                    <label>Monthly Income (₹)</label>
                    <input type="number" name="monthlyIncome" value={formData.monthlyIncome} onChange={handleChange} />
                </div>

                <div style={{ gridColumn: '1 / -1', marginTop: '2rem', display: 'flex', gap: '1rem', justifyContent: 'flex-end' }}>
                    <button type="button" onClick={onCancel} className="btn btn-ghost">Cancel</button>
                    <button type="submit" className="btn btn-primary" disabled={loading} style={{ minWidth: '150px' }}>
                        {loading ? 'Saving...' : 'Save Changes'}
                    </button>
                </div>
            </form>

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
            `}</style>
        </div>
    );
};

export default EditProfile;
