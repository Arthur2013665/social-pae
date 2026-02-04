// Social media links - you can update these later
const socialLinks = {
    youtube: 'https://www.youtube.com/channel/UCkvDYKFD2MjU1zqGuy1cSTA',
    discord: 'https://discord.gg/3VszCHsxMc'
};

// Profile data - you can customize this
const profileData = {
    name: 'FMR',
    about: 'Content Creator, Gamer & Developer',
    profileImage: 'avatar.jpeg'
};

// Particles system
class ParticleSystem {
    constructor() {
        this.canvas = document.getElementById('particles-canvas');
        this.ctx = this.canvas.getContext('2d');
        this.particles = [];
        this.particleCount = 80;
        
        this.resize();
        this.createParticles();
        this.animate();
        
        window.addEventListener('resize', () => this.resize());
    }
    
    resize() {
        this.canvas.width = window.innerWidth;
        this.canvas.height = window.innerHeight;
    }
    
    createParticles() {
        this.particles = [];
        for (let i = 0; i < this.particleCount; i++) {
            this.particles.push({
                x: Math.random() * this.canvas.width,
                y: Math.random() * this.canvas.height,
                size: Math.random() * 9 + 3,
                speedY: Math.random() * 2 + 0.5,
                speedX: (Math.random() - 0.5) * 0.5,
                opacity: Math.random() * 0.6 + 0.2,
                color: this.getRandomColor()
            });
        }
    }
    
    getRandomColor() {
        // Check if B&W mode is active
        const isBWMode = document.body.classList.contains('dark-mode');
        
        if (isBWMode) {
            // White particles for B&W mode
            const whiteColors = [
                'rgba(255, 255, 255, ',
                'rgba(240, 240, 240, ',
                'rgba(220, 220, 220, '
            ];
            return whiteColors[Math.floor(Math.random() * whiteColors.length)];
        } else {
            // Colorful particles for normal mode
            const colors = [
                'rgba(255, 255, 255, ',
                'rgba(100, 149, 237, ',
                'rgba(147, 112, 219, ',
                'rgba(64, 224, 208, ',
                'rgba(255, 182, 193, '
            ];
            return colors[Math.floor(Math.random() * colors.length)];
        }
    }
    
    updateParticles() {
        // Check if we need to update particle colors due to mode change
        const isBWMode = document.body.classList.contains('dark-mode');
        
        this.particles.forEach(particle => {
            // Move particle up
            particle.y -= particle.speedY;
            particle.x += particle.speedX;
            
            // Reset particle when it goes off screen
            if (particle.y < -10) {
                particle.y = this.canvas.height + 10;
                particle.x = Math.random() * this.canvas.width;
                particle.color = this.getRandomColor(); // Update color when resetting
            }
            
            // Keep particles within horizontal bounds
            if (particle.x < 0 || particle.x > this.canvas.width) {
                particle.speedX *= -1;
            }
        });
    }
    
    drawParticles() {
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
        
        this.particles.forEach(particle => {
            this.ctx.beginPath();
            this.ctx.arc(particle.x, particle.y, particle.size, 0, Math.PI * 2);
            this.ctx.fillStyle = particle.color + particle.opacity + ')';
            this.ctx.fill();
            
            // Add a subtle glow effect
            this.ctx.shadowBlur = 10;
            this.ctx.shadowColor = particle.color + '0.3)';
            this.ctx.fill();
            this.ctx.shadowBlur = 0;
        });
    }
    
    animate() {
        this.updateParticles();
        this.drawParticles();
        requestAnimationFrame(() => this.animate());
    }
}

// DOM elements
const darkModeToggle = document.getElementById('darkModeToggle');
const youtubeBtn = document.getElementById('youtubeBtn');
const discordBtn = document.getElementById('discordBtn');
const profileName = document.getElementById('profileName');
const profileAbout = document.getElementById('profileAbout');
const profileImg = document.getElementById('profileImg');
const settingsIcon = document.getElementById('settingsIcon');
const settingsPanel = document.getElementById('settingsPanel');
const bgvid = document.getElementById('bgvid');
const refreshBtn = document.getElementById('refreshBtn');
const shareBtn = document.getElementById('shareBtn');

// Wallpaper configurations
const wallpapers = {
    // Animated gradients
    gradient1: {
        background: 'linear-gradient(270deg, #2dd4bf, #3b82f6, #8b5cf6, #667eea, #764ba2)',
        name: 'Teal Flow',
        animated: true
    },
    gradient2: {
        background: 'linear-gradient(270deg, #667eea, #764ba2, #8b5cf6, #9b59b6, #8e44ad)',
        name: 'Purple Dream',
        animated: true
    },
    gradient3: {
        background: 'linear-gradient(270deg, #ff6b6b, #feca57, #ff9ff3, #f093fb, #f5576c)',
        name: 'Sunset Glow',
        animated: true
    },
    gradient4: {
        background: 'linear-gradient(270deg, #74b9ff, #0984e3, #6c5ce7, #a29bfe, #fd79a8)',
        name: 'Ocean Breeze',
        animated: true
    },
    gradient5: {
        background: 'linear-gradient(270deg, #ff6b6b, #ee5a24, #ff9ff3, #f093fb, #ff6348)',
        name: 'Fire Wave',
        animated: true
    },
    gradient6: {
        background: 'linear-gradient(270deg, #00d2d3, #54a0ff, #5f27cd, #341f97, #00d2d3)',
        name: 'Neon Nights',
        animated: true
    },
    gradient7: {
        background: 'linear-gradient(270deg, #341f97, #5f27cd, #00d2d3, #54a0ff, #341f97)',
        name: 'Cosmic Flow',
        animated: true
    },
    gradient8: {
        background: 'linear-gradient(270deg, #ff9ff3, #54a0ff, #5f27cd, #ff6b6b, #feca57)',
        name: 'Rainbow Shift',
        animated: true
    },
    gradient9: {
        background: 'linear-gradient(270deg, #00f5ff, #0099ff, #6600ff, #ff0099, #00f5ff)',
        name: 'Electric Storm',
        animated: true
    },
    gradient10: {
        background: 'linear-gradient(270deg, #8e2de2, #4a00e0, #ff006e, #8338ec, #3a1c71)',
        name: 'Mystic Flow',
        animated: true
    },
    gradient11: {
        background: 'linear-gradient(270deg, #00d4aa, #00c9ff, #92fe9d, #00c9ff, #00d4aa)',
        name: 'Cyber Wave',
        animated: true
    },
    gradient12: {
        background: 'linear-gradient(270deg, #ff0844, #ffb199, #ff6b6b, #4ecdc4, #44a08d)',
        name: 'Plasma Dance',
        animated: true
    },
    gradient13: {
        background: 'linear-gradient(270deg, #667eea, #764ba2, #f093fb, #f5576c, #4facfe)',
        name: 'Aurora Storm',
        animated: true
    },
    gradient14: {
        background: 'linear-gradient(270deg, #4facfe, #00f2fe, #43e97b, #38f9d7, #4facfe)',
        name: 'Neon Dreams',
        animated: true
    },
    gradient15: {
        background: 'linear-gradient(270deg, #667eea, #764ba2, #f093fb, #f5576c, #4facfe)',
        name: 'Galaxy Spiral',
        animated: true
    },
    gradient16: {
        background: 'linear-gradient(270deg, #ff9a9e, #fecfef, #fecfef, #ff9a9e, #fad0c4)',
        name: 'Prism Light',
        animated: true
    },
    gradient17: {
        background: 'linear-gradient(270deg, #c0c0c0, #87ceeb, #4682b4, #708090, #c0c0c0)',
        name: 'Liquid Metal',
        animated: true
    },
    gradient18: {
        background: 'linear-gradient(270deg, #ff4500, #ff6347, #ffa500, #ff8c00, #ff4500)',
        name: 'Phoenix Fire',
        animated: true
    },
    gradient19: {
        background: 'linear-gradient(270deg, #e0e6ff, #c9d6ff, #667eea, #764ba2, #e0e6ff)',
        name: 'Crystal Cave',
        animated: true
    },
    gradient20: {
        background: 'linear-gradient(270deg, #00c6ff, #0072ff, #9400d3, #4b0082, #00c6ff)',
        name: 'Quantum Flow',
        animated: true
    },
    // Static gradients
    static1: {
        background: 'linear-gradient(135deg, #0c0c0c 0%, #2d3748 50%, #4a5568 100%)',
        name: 'Midnight',
        animated: false
    },
    static2: {
        background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
        name: 'Aurora',
        animated: false
    },
    static3: {
        background: 'linear-gradient(135deg, #ff9a9e 0%, #fecfef 50%, #fecfef 100%)',
        name: 'Coral Reef',
        animated: false
    },
    static4: {
        background: 'linear-gradient(135deg, #134e5e 0%, #71b280 100%)',
        name: 'Forest',
        animated: false
    },
    static5: {
        background: 'linear-gradient(135deg, #667eea 0%, #764ba2 50%, #8b5cf6 100%)',
        name: 'Purple Haze',
        animated: false
    },
    static6: {
        background: 'linear-gradient(135deg, #0f0c29 0%, #302b63 50%, #24243e 100%)',
        name: 'Deep Space',
        animated: false
    },
    static7: {
        background: 'linear-gradient(135deg, #f7971e 0%, #ffd200 100%)',
        name: 'Golden Hour',
        animated: false
    },
    static8: {
        background: 'linear-gradient(135deg, #a8edea 0%, #fed6e3 100%)',
        name: 'Arctic Frost',
        animated: false
    },
    static9: {
        background: 'linear-gradient(135deg, #2c3e50 0%, #4a4a4a 50%, #8b4513 100%)',
        name: 'Volcanic Ash',
        animated: false
    },
    static10: {
        background: 'linear-gradient(135deg, #1e3c72 0%, #2a5298 50%, #0f4c75 100%)',
        name: 'Ocean Depths',
        animated: false
    },
    static11: {
        background: 'linear-gradient(135deg, #ff7e5f 0%, #feb47b 50%, #ff6b35 100%)',
        name: 'Desert Sunset',
        animated: false
    },
    static12: {
        background: 'linear-gradient(135deg, #56ab2f 0%, #a8e6cf 50%, #2e8b57 100%)',
        name: 'Emerald Valley',
        animated: false
    },
    static13: {
        background: 'linear-gradient(135deg, #6a0572 0%, #ab83a1 50%, #9b59b6 100%)',
        name: 'Royal Purple',
        animated: false
    },
    static14: {
        background: 'linear-gradient(135deg, #8b0000 0%, #dc143c 50%, #b22222 100%)',
        name: 'Crimson Night',
        animated: false
    },
    static15: {
        background: 'linear-gradient(135deg, #2c3e50 0%, #bdc3c7 50%, #ecf0f1 100%)',
        name: 'Moonlight Silver',
        animated: false
    },
    static16: {
        background: 'linear-gradient(135deg, #b7472a 0%, #d2691e 50%, #cd853f 100%)',
        name: 'Copper Glow',
        animated: false
    },
    static17: {
        background: 'linear-gradient(135deg, #dda0dd 0%, #e6e6fa 50%, #9370db 100%)',
        name: 'Lavender Fields',
        animated: false
    },
    static18: {
        background: 'linear-gradient(135deg, #ff7f50 0%, #ffa500 50%, #ff6347 100%)',
        name: 'Autumn Leaves',
        animated: false
    },
    static19: {
        background: 'linear-gradient(135deg, #4682b4 0%, #5f9ea0 50%, #708090 100%)',
        name: 'Steel Blue',
        animated: false
    },
    static20: {
        background: 'linear-gradient(135deg, #ffc0cb 0%, #ffb6c1 50%, #dda0dd 100%)',
        name: 'Rose Gold',
        animated: false
    }
};

// Initialize the page
function initializePage() {
    // Set profile data
    profileName.textContent = profileData.name;
    profileAbout.textContent = profileData.about;
    profileImg.src = profileData.profileImage;
    profileImg.alt = `${profileData.name}'s profile picture`;

    // Check for saved black and white mode preference
    const isBWMode = localStorage.getItem('darkMode') === 'true';
    if (isBWMode) {
        document.body.classList.add('dark-mode');
        darkModeToggle.checked = true;
    }

    // Add click handlers for social buttons
    youtubeBtn.addEventListener('click', () => {
        window.open(socialLinks.youtube, '_blank');
    });

    discordBtn.addEventListener('click', () => {
        window.open(socialLinks.discord, '_blank');
    });

    // Dark mode toggle handler
    darkModeToggle.addEventListener('change', toggleBlackWhiteMode);

    // Add keyboard navigation
    addKeyboardNavigation();
    
    // Initialize settings panel
    initializeSettings();
    
    // Initialize action buttons
    initializeActionButtons();
}

// Toggle black and white mode
function toggleBlackWhiteMode() {
    const isBWMode = darkModeToggle.checked;
    
    if (isBWMode) {
        document.body.classList.add('dark-mode');
        localStorage.setItem('darkMode', 'true');
    } else {
        document.body.classList.remove('dark-mode');
        localStorage.setItem('darkMode', 'false');
    }
    
    // Update all existing particle colors immediately
    if (window.particleSystem) {
        window.particleSystem.particles.forEach(particle => {
            particle.color = window.particleSystem.getRandomColor();
        });
    }
}

// Add keyboard navigation for accessibility
function addKeyboardNavigation() {
    const buttons = [youtubeBtn, discordBtn];
    
    buttons.forEach(button => {
        button.setAttribute('tabindex', '0');
        button.setAttribute('role', 'button');
        
        button.addEventListener('keydown', (e) => {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                button.click();
            }
        });
    });
}

// Function to update social links (you can call this to change links)
function updateSocialLinks(newLinks) {
    Object.assign(socialLinks, newLinks);
}

// Function to update profile data (you can call this to change profile info)
function updateProfile(newData) {
    Object.assign(profileData, newData);
    
    if (newData.name) {
        profileName.textContent = newData.name;
        profileImg.alt = `${newData.name}'s profile picture`;
    }
    if (newData.about) {
        profileAbout.textContent = newData.about;
    }
    if (newData.profileImage) {
        profileImg.src = newData.profileImage;
    }
}

// Add some visual feedback for button interactions
function addButtonFeedback() {
    const buttons = document.querySelectorAll('.wrapper .button');
    
    buttons.forEach(button => {
        button.addEventListener('mousedown', () => {
            button.style.transform = 'scale(0.95)';
        });
        
        button.addEventListener('mouseup', () => {
            button.style.transform = 'scale(1)';
        });
        
        button.addEventListener('mouseleave', () => {
            button.style.transform = 'scale(1)';
        });
    });
}

// Initialize action buttons
function initializeActionButtons() {
    // Refresh button
    refreshBtn.addEventListener('click', () => {
        // Add spin animation
        refreshBtn.querySelector('i').style.animation = 'spin 0.5s ease-in-out';
        
        // Refresh page after animation
        setTimeout(() => {
            location.reload();
        }, 500);
    });
    
    // Share button
    shareBtn.addEventListener('click', async () => {
        const shareData = {
            title: 'FMR - Social Media Profile',
            text: 'Check out my awesome social media profile page!',
            url: window.location.href
        };
        
        try {
            // Try native Web Share API first
            if (navigator.share) {
                await navigator.share(shareData);
            } else {
                // Fallback to clipboard
                await navigator.clipboard.writeText(window.location.href);
                
                // Show feedback
                const originalIcon = shareBtn.querySelector('i');
                originalIcon.className = 'fas fa-check';
                shareBtn.title = 'Link copied to clipboard!';
                
                // Reset after 2 seconds
                setTimeout(() => {
                    originalIcon.className = 'fas fa-share-alt';
                    shareBtn.title = 'Share Page';
                }, 2000);
            }
        } catch (error) {
            console.log('Sharing failed:', error);
            
            // Fallback: try to copy to clipboard
            try {
                await navigator.clipboard.writeText(window.location.href);
                const originalIcon = shareBtn.querySelector('i');
                originalIcon.className = 'fas fa-check';
                shareBtn.title = 'Link copied to clipboard!';
                
                setTimeout(() => {
                    originalIcon.className = 'fas fa-share-alt';
                    shareBtn.title = 'Share Page';
                }, 2000);
            } catch (clipboardError) {
                console.log('Clipboard access failed:', clipboardError);
            }
        }
    });
}

// Initialize settings panel
function initializeSettings() {
    // Toggle settings panel
    settingsIcon.addEventListener('click', () => {
        settingsPanel.classList.toggle('active');
    });
    
    // Close settings panel when clicking outside
    document.addEventListener('click', (e) => {
        if (!settingsIcon.contains(e.target) && !settingsPanel.contains(e.target)) {
            settingsPanel.classList.remove('active');
        }
    });
    
    // Add wallpaper option click handlers
    const wallpaperOptions = document.querySelectorAll('.wallpaper-option');
    wallpaperOptions.forEach(option => {
        option.addEventListener('click', () => {
            const bgType = option.dataset.bg;
            changeWallpaper(bgType);
            updateActiveWallpaper(bgType);
        });
    });
    
    // Load saved wallpaper
    const savedWallpaper = localStorage.getItem('selectedWallpaper') || 'gradient1';
    changeWallpaper(savedWallpaper);
    updateActiveWallpaper(savedWallpaper);
}

// Update active wallpaper selection
function updateActiveWallpaper(bgType) {
    const wallpaperOptions = document.querySelectorAll('.wallpaper-option');
    wallpaperOptions.forEach(opt => opt.classList.remove('active'));
    
    const activeOption = document.querySelector(`[data-bg="${bgType}"]`);
    if (activeOption) {
        activeOption.classList.add('active');
    }
    
    // Save selection
    localStorage.setItem('selectedWallpaper', bgType);
}

// Change wallpaper function
function changeWallpaper(bgType) {
    const wallpaper = wallpapers[bgType];
    if (wallpaper) {
        bgvid.style.background = wallpaper.background;
        
        if (wallpaper.animated) {
            // Animated gradient
            bgvid.style.backgroundSize = '800% 800%';
            bgvid.style.animation = 'gradientAnimation 15s ease infinite';
        } else {
            // Static gradient
            bgvid.style.backgroundSize = '100% 100%';
            bgvid.style.animation = 'none';
        }
    }
}

// Initialize everything when the page loads
document.addEventListener('DOMContentLoaded', () => {
    initializePage();
    addButtonFeedback();
    
    // Initialize particle system and store reference globally
    window.particleSystem = new ParticleSystem();
});

// Export functions for external use (if needed)
window.updateSocialLinks = updateSocialLinks;
window.updateProfile = updateProfile;