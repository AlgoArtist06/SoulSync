import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import AuthForm from '../components/AuthForm';

const Login = () => {
    const navigate = useNavigate();
    const [error, setError] = useState('');

    const handleLogin = async (formData) => {
        try {
            const response = await fetch('/api/v1/auth/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    email: formData.email,
                    password: formData.password,
                }),
            });

            if (!response.ok) {
                throw new Error('Invalid credentials');
            }

            const data = await response.json();
            localStorage.setItem('token', data.token);
            // Save user ID from the nested user object in response
            // AuthResponse contains: token, user (UserResponse)
            if (data.user && data.user.userId) {
                localStorage.setItem('userId', data.user.userId);
            }
            navigate('/dashboard'); // Redirect to dashboard
        } catch (err) {
            setError(err.message || 'Login failed');
        }
    };

    return (
        <AuthForm
            title="Welcome Back to"
            type="login"
            onSubmit={handleLogin}
            error={error}
        />
    );
};

export default Login;
