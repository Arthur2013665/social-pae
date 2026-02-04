#!/bin/bash

# Social Media Page Generator Script
# Usage: ./generate-social-page.sh <channel_name> <dc_name> <youtube_link> <discord_link> [output_dir]

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to display usage
show_usage() {
    echo -e "${BLUE}Social Media Page Generator${NC}"
    echo -e "${YELLOW}Usage:${NC}"
    echo "  $0                                           # Interactive mode (prompts for input)"
    echo "  $0 <channel_name> <dc_name> <youtube_link> <discord_link> [output_dir]"
    echo ""
    echo -e "${YELLOW}Parameters:${NC}"
    echo "  channel_name  - Your YouTube channel name (e.g., 'FMR')"
    echo "  dc_name       - Your Discord server name (e.g., 'FMR's basement')"
    echo "  youtube_link  - Your YouTube channel URL"
    echo "  discord_link  - Your Discord server invite link (non-expiring)"
    echo "  output_dir    - Output directory (optional, defaults to current directory)"
    echo ""
    echo -e "${YELLOW}Examples:${NC}"
    echo "  $0                                           # Run in interactive mode"
    echo "  $0 'FMR' \"FMR's basement\" 'https://youtube.com/@fmr' 'https://discord.gg/abc123' './my-page'"
}

# Function to prompt for parameters interactively
prompt_for_parameters() {
    echo -e "${BLUE}Social Media Page Generator - Interactive Mode${NC}"
    echo ""
    
    # Channel Name
    echo -e "${YELLOW}Enter your YouTube channel name:${NC}"
    read -p "> " CHANNEL_NAME
    while [ -z "$CHANNEL_NAME" ]; do
        echo -e "${RED}Channel name cannot be empty!${NC}"
        read -p "> " CHANNEL_NAME
    done
    
    # Discord Name
    echo -e "${YELLOW}Enter your Discord server name:${NC}"
    read -p "> " DC_NAME
    while [ -z "$DC_NAME" ]; do
        echo -e "${RED}Discord server name cannot be empty!${NC}"
        read -p "> " DC_NAME
    done
    
    # YouTube Link
    echo -e "${YELLOW}Enter your YouTube channel URL:${NC}"
    read -p "> " YOUTUBE_LINK
    while [[ ! "$YOUTUBE_LINK" =~ ^https?:// ]]; do
        echo -e "${RED}Please enter a valid URL starting with http:// or https://${NC}"
        read -p "> " YOUTUBE_LINK
    done
    
    # Discord Link
    echo -e "${YELLOW}Enter your Discord server invite link:${NC}"
    read -p "> " DISCORD_LINK
    while [[ ! "$DISCORD_LINK" =~ ^https?:// ]]; do
        echo -e "${RED}Please enter a valid URL starting with http:// or https://${NC}"
        read -p "> " DISCORD_LINK
    done
    
    # Output Directory
    echo -e "${YELLOW}Enter output directory (press Enter for current directory):${NC}"
    read -p "> " OUTPUT_DIR
    if [ -z "$OUTPUT_DIR" ]; then
        OUTPUT_DIR="."
    fi
    
    echo ""
}

# Check if arguments provided or use interactive mode
if [ $# -eq 0 ]; then
    # Interactive mode
    prompt_for_parameters
elif [ $# -lt 4 ] || [ $# -gt 5 ]; then
    echo -e "${RED}Error: Invalid number of arguments${NC}"
    show_usage
    exit 1
else
    # Parse arguments from command line
    CHANNEL_NAME="$1"
    DC_NAME="$2"
    YOUTUBE_LINK="$3"
    DISCORD_LINK="$4"
    OUTPUT_DIR="${5:-.}"
fi

# Validate URLs
if [[ ! "$YOUTUBE_LINK" =~ ^https?:// ]]; then
    echo -e "${RED}Error: YouTube link must start with http:// or https://${NC}"
    exit 1
fi

if [[ ! "$DISCORD_LINK" =~ ^https?:// ]]; then
    echo -e "${RED}Error: Discord link must start with http:// or https://${NC}"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo -e "${BLUE}Generating social media page...${NC}"
echo -e "${YELLOW}Channel Name:${NC} $CHANNEL_NAME"
echo -e "${YELLOW}Discord Name:${NC} $DC_NAME"
echo -e "${YELLOW}YouTube Link:${NC} $YOUTUBE_LINK"
echo -e "${YELLOW}Discord Link:${NC} $DISCORD_LINK"
echo -e "${YELLOW}Output Directory:${NC} $OUTPUT_DIR"
echo ""

# Generate index.html
cat > "$OUTPUT_DIR/index.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CHANNEL_NAME_PLACEHOLDER - Social Media Profile</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div id="bgvid">
        <canvas id="particles-canvas"></canvas>
    </div>
    
    <!-- Settings Tab -->
    <div class="settings-tab" id="settingsTab">
        <div class="settings-icon" id="settingsIcon">
            <i class="fas fa-cog"></i>
        </div>
        <div class="settings-panel" id="settingsPanel">
            <h3>Wallpaper Settings</h3>
            
            <!-- Animated Gradients Section -->
            <div class="wallpaper-section">
                <h4>Animated Gradients</h4>
                <div class="wallpaper-options">
                    <div class="wallpaper-option" data-bg="gradient1" data-type="animated">
                        <div class="preview gradient1-preview"></div>
                        <span>Teal Flow</span>
                    </div>
                    <div class="wallpaper-option" data-bg="gradient2" data-type="animated">
                        <div class="preview gradient2-preview"></div>
                        <span>Purple Dream</span>
                    </div>
                    <div class="wallpaper-option" data-bg="gradient3" data-type="animated">
                        <div class="preview gradient3-preview"></div>
                        <span>Sunset Glow</span>
                    </div>
                    <div class="wallpaper-option" data-bg="gradient4" data-type="animated">
                        <div class="preview gradient4-preview"></div>
                        <span>Ocean Breeze</span>
                    </div>
                    <div class="wallpaper-option" data-bg="gradient5" data-type="animated">
                        <div class="preview gradient5-preview"></div>
                        <span>Fire Wave</span>
                    </div>
                    <div class="wallpaper-option" data-bg="gradient6" data-type="animated">
                        <div class="preview gradient6-preview"></div>
                        <span>Neon Nights</span>
                    </div>
                    <div class="wallpaper-option" data-bg="gradient7" data-type="animated">
                        <div class="preview gradient7-preview"></div>
                        <span>Cosmic Flow</span>
                    </div>
                    <div class="wallpaper-option" data-bg="gradient8" data-type="animated">
                        <div class="preview gradient8-preview"></div>
                        <span>Rainbow Shift</span>
                    </div>
                </div>
            </div>
            
            <!-- Static Gradients Section -->
            <div class="wallpaper-section">
                <h4>Static Gradients</h4>
                <div class="wallpaper-options">
                    <div class="wallpaper-option" data-bg="static1" data-type="static">
                        <div class="preview static1-preview"></div>
                        <span>Midnight</span>
                    </div>
                    <div class="wallpaper-option" data-bg="static2" data-type="static">
                        <div class="preview static2-preview"></div>
                        <span>Aurora</span>
                    </div>
                    <div class="wallpaper-option" data-bg="static3" data-type="static">
                        <div class="preview static3-preview"></div>
                        <span>Coral Reef</span>
                    </div>
                    <div class="wallpaper-option" data-bg="static4" data-type="static">
                        <div class="preview static4-preview"></div>
                        <span>Forest</span>
                    </div>
                    <div class="wallpaper-option" data-bg="static5" data-type="static">
                        <div class="preview static5-preview"></div>
                        <span>Purple Haze</span>
                    </div>
                    <div class="wallpaper-option" data-bg="static6" data-type="static">
                        <div class="preview static6-preview"></div>
                        <span>Deep Space</span>
                    </div>
                    <div class="wallpaper-option" data-bg="static7" data-type="static">
                        <div class="preview static7-preview"></div>
                        <span>Golden Hour</span>
                    </div>
                    <div class="wallpaper-option" data-bg="static8" data-type="static">
                        <div class="preview static8-preview"></div>
                        <span>Arctic Frost</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Action Buttons -->
    <div class="action-buttons">
        <div class="action-button" id="refreshBtn" title="Refresh Page">
            <i class="fas fa-sync-alt"></i>
        </div>
        <div class="action-button" id="shareBtn" title="Share Page">
            <i class="fas fa-share-alt"></i>
        </div>
    </div>
    
    <div class="ohraniceni">
        <div class="img-area">
            <div class="inner-area">
                <img src="https://via.placeholder.com/150x150/333333/ffffff?text=CHANNEL_NAME_PLACEHOLDER" alt="CHANNEL_NAME_PLACEHOLDER's profile picture" id="profileImg">
            </div>
        </div>
        
        <div class="name" id="profileName">CHANNEL_NAME_PLACEHOLDER</div>
        <div class="about" id="profileAbout">Content Creator, Gamer & Developer</div>
        
        <div class="wrapper">
            <div class="button" id="youtubeBtn" title="CHANNEL_NAME_PLACEHOLDER">
                <div class="icon">
                    <i class="fab fa-youtube"></i>
                </div>
                <span>CHANNEL_NAME_PLACEHOLDER</span>
            </div>
            
            <div class="button" id="discordBtn" title="DC_NAME_PLACEHOLDER">
                <div class="icon">
                    <i class="fab fa-discord"></i>
                </div>
                <span>DC_NAME_PLACEHOLDER</span>
            </div>
        </div>
        
        <div class="settings">
            <label class="switch">
                <input type="checkbox" id="darkModeToggle">
                <span class="slider round"></span>
            </label>
            <span class="toggle-label">B&W Mode</span>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>
EOF

# Replace placeholders in HTML
sed -i "s/CHANNEL_NAME_PLACEHOLDER/$CHANNEL_NAME/g" "$OUTPUT_DIR/index.html"
sed -i "s/DC_NAME_PLACEHOLDER/$DC_NAME/g" "$OUTPUT_DIR/index.html"

echo -e "${GREEN}✓${NC} Generated index.html"

# Copy CSS file
cp style.css "$OUTPUT_DIR/style.css"
echo -e "${GREEN}✓${NC} Copied style.css"

# Generate script.js with custom links
cat > "$OUTPUT_DIR/script.js" << 'EOF'
// Social media links - you can update these later
const socialLinks = {
    youtube: 'YOUTUBE_LINK_PLACEHOLDER',
    discord: 'DISCORD_LINK_PLACEHOLDER'
};

// Profile data - you can customize this
const profileData = {
    name: 'CHANNEL_NAME_PLACEHOLDER',
    about: 'Content Creator, Gamer & Developer',
    profileImage: 'https://via.placeholder.com/150x150/333333/ffffff?text=CHANNEL_NAME_PLACEHOLDER'
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
                size: Math.random() * 6 + 2,
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
            title: 'CHANNEL_NAME_PLACEHOLDER - Social Media Profile',
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
EOF

# Replace placeholders in JavaScript
sed -i "s/CHANNEL_NAME_PLACEHOLDER/$CHANNEL_NAME/g" "$OUTPUT_DIR/script.js"
sed -i "s|YOUTUBE_LINK_PLACEHOLDER|$YOUTUBE_LINK|g" "$OUTPUT_DIR/script.js"
sed -i "s|DISCORD_LINK_PLACEHOLDER|$DISCORD_LINK|g" "$OUTPUT_DIR/script.js"

echo -e "${GREEN}✓${NC} Generated script.js with custom links"

echo ""
echo -e "${GREEN}🎉 Social media page generated successfully!${NC}"
echo -e "${YELLOW}Files created in:${NC} $OUTPUT_DIR"
echo -e "${YELLOW}Files:${NC}"
echo "  - index.html"
echo "  - style.css"
echo "  - script.js"
echo ""
echo -e "${BLUE}To view your page:${NC}"
echo "  1. Open $OUTPUT_DIR/index.html in your browser"
echo "  2. Or serve it with a local web server"
echo ""
echo -e "${BLUE}Features included:${NC}"
echo "  ✓ Animated particle background"
echo "  ✓ 16 gradient wallpaper options"
echo "  ✓ Responsive social media buttons"
echo "  ✓ B&W mode toggle"
echo "  ✓ Settings panel with wallpaper customization"
echo "  ✓ Refresh and share buttons"
echo "  ✓ Intro animations"
echo "  ✓ Custom transparent scrollbars"