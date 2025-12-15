import React, { useState } from 'react';

const SearchFilters = ({ onSearch, loading }) => {
    const [filters, setFilters] = useState({
        religion: 'Any',
        minAge: '',
        maxAge: '',
        education: 'Any',
        minIncome: '',
        maxIncome: '',
        minHeight: '',
        maxHeight: ''
    });

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFilters(prev => ({
            ...prev,
            [name]: value
        }));
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        const searchRequest = {
            religion: filters.religion === 'Any' ? null : filters.religion,
            minAge: filters.minAge ? parseInt(filters.minAge) : null,
            maxAge: filters.maxAge ? parseInt(filters.maxAge) : null,
            education: filters.education === 'Any' ? null : filters.education,
            minIncome: filters.minIncome ? parseFloat(filters.minIncome) : null,
            maxIncome: filters.maxIncome ? parseFloat(filters.maxIncome) : null,
            minHeight: filters.minHeight ? parseFloat(filters.minHeight) : null,
            maxHeight: filters.maxHeight ? parseFloat(filters.maxHeight) : null
        };
        onSearch(searchRequest);
    };

    const handleReset = () => {
        setFilters({
            religion: 'Any',
            minAge: '',
            maxAge: '',
            education: 'Any',
            minIncome: '',
            maxIncome: '',
            minHeight: '',
            maxHeight: ''
        });
    };

    return (
        <form onSubmit={handleSubmit} className="glass-panel" style={{ padding: '2rem', marginBottom: '3rem' }}>
            <div style={{
                fontSize: '1.5rem',
                fontWeight: 'bold',
                marginBottom: '1.5rem',
                display: 'flex',
                alignItems: 'center',
                gap: '0.75rem',
                color: 'white'
            }}>
                <span style={{ fontSize: '1.75rem' }}>🔍</span>
                <span className="text-gradient">Find Your Match</span>
            </div>

            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(220px, 1fr))', gap: '1.5rem' }}>
                {/* Religion */}
                <div>
                    <label style={{ display: 'block', marginBottom: '0.5rem', fontSize: '0.9rem', color: 'var(--color-text-muted)' }}>Religion</label>
                    <select name="religion" value={filters.religion} onChange={handleChange}>
                        <option value="Any">Any Religion</option>
                        <option value="Hindu">Hindu</option>
                        <option value="Muslim">Muslim</option>
                        <option value="Christian">Christian</option>
                        <option value="Sikh">Sikh</option>
                        <option value="Buddhist">Buddhist</option>
                        <option value="Jain">Jain</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                {/* Education */}
                <div>
                    <label style={{ display: 'block', marginBottom: '0.5rem', fontSize: '0.9rem', color: 'var(--color-text-muted)' }}>Education</label>
                    <select name="education" value={filters.education} onChange={handleChange}>
                        <option value="Any">Any Education</option>
                        <option value="High School">High School</option>
                        <option value="Bachelors">Bachelors</option>
                        <option value="Masters">Masters</option>
                        <option value="PhD">PhD</option>
                    </select>
                </div>

                {/* Age Range */}
                <div>
                    <label style={{ display: 'block', marginBottom: '0.5rem', fontSize: '0.9rem', color: 'var(--color-text-muted)' }}>Age Range</label>
                    <div style={{ display: 'flex', gap: '0.5rem' }}>
                        <input type="number" name="minAge" value={filters.minAge} onChange={handleChange} placeholder="Min" />
                        <input type="number" name="maxAge" value={filters.maxAge} onChange={handleChange} placeholder="Max" />
                    </div>
                </div>

                {/* Income Range */}
                <div>
                    <label style={{ display: 'block', marginBottom: '0.5rem', fontSize: '0.9rem', color: 'var(--color-text-muted)' }}>Income ($)</label>
                    <div style={{ display: 'flex', gap: '0.5rem' }}>
                        <input type="number" name="minIncome" value={filters.minIncome} onChange={handleChange} placeholder="Min" />
                        <input type="number" name="maxIncome" value={filters.maxIncome} onChange={handleChange} placeholder="Max" />
                    </div>
                </div>

                {/* Height Range */}
                <div>
                    <label style={{ display: 'block', marginBottom: '0.5rem', fontSize: '0.9rem', color: 'var(--color-text-muted)' }}>Height (cm)</label>
                    <div style={{ display: 'flex', gap: '0.5rem' }}>
                        <input type="number" name="minHeight" value={filters.minHeight} onChange={handleChange} placeholder="Min" />
                        <input type="number" name="maxHeight" value={filters.maxHeight} onChange={handleChange} placeholder="Max" />
                    </div>
                </div>
            </div>

            {/* Buttons */}
            <div style={{ display: 'flex', gap: '1rem', marginTop: '2rem', paddingTop: '1.5rem', borderTop: '1px solid var(--color-border)' }}>
                <button type="submit" className="btn btn-primary" style={{ flex: 1 }} disabled={loading}>
                    {loading ? 'Searching...' : 'Search Profiles'}
                </button>
                <button type="button" onClick={handleReset} className="btn btn-secondary" style={{ flex: 1 }}>
                    Reset Filters
                </button>
            </div>
        </form>
    );
};

export default SearchFilters;
