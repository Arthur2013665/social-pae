// Social media links - you can update these later
const socialLinks = {
    youtube: 'https://www.youtube.com/channel/UCkvDYKFD2MjU1zqGuy1cSTA',
    discord: 'https://discord.gg/3VszCHsxMc'
};

// Profile data - you can customize this
const profileData = {
    name: 'FMR',
    about: 'Content Creator, Gamer & Developer',
    profileImage: 'https://yt3.googleusercontent.com/ytc/AIdro_kKZhFE-9gv1L0yCC-8J8H1w8TgS8RgBQI-PcNd=s176-c-k-c0x00ffffff-no-rj'
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