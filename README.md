# 🎨 Social Media Profile Page Generator

A beautiful, animated social media profile page with customizable wallpapers, particle effects, and modern glass morphism design.

**🔗 Repository:** https://github.com/Arthur2013665/social-pae

## ✨ Features

- **🌊 Animated Particle Background** - 80 flowing particles with customizable colors
- **🎨 16 Gradient Wallpapers** - 8 animated + 8 static gradient options
- **🌙 B&W Mode Toggle** - Switch between colorful and monochrome themes
- **⚙️ Settings Panel** - Easy wallpaper customization with live preview
- **📱 Responsive Design** - Works perfectly on desktop and mobile
- **🎭 Intro Animations** - Smooth staggered animations on page load
- **🔄 Action Buttons** - Refresh page and share functionality
- **🎯 Social Media Integration** - YouTube and Discord buttons with hover effects
- **🪟 Glass Morphism UI** - Modern transparent design elements
- **📜 Custom Scrollbars** - Transparent scrollbars matching the design theme

## 🚀 Quick Start

### Interactive Mode (Recommended)
```bash
./generate-social-page.sh
```
The script will prompt you for all required information step by step.

### Command Line Mode
```bash
./generate-social-page.sh "Channel Name" "Discord Server" "https://youtube.com/..." "https://discord.gg/..." [output_dir]
```

## 📋 Requirements

- Bash shell (Linux/macOS/WSL)
- Web browser for viewing the generated page
- Internet connection (for Font Awesome icons)

## 🛠️ Installation

1. **Clone or download** this repository
   ```bash
   git clone https://github.com/Arthur2013665/social-pae.git
   cd social-pae
   ```
2. **Run the generator:**
   ```bash
   ./generate-social-page.sh
   ```

> **Note:** The script is already executable in the repository. If you downloaded the files manually, you may need to make it executable with `chmod +x generate-social-page.sh`

## 📖 Usage Examples

### Interactive Mode
```bash
$ ./generate-social-page.sh

Social Media Page Generator - Interactive Mode

Enter your YouTube channel name:
> FMR

Enter your Discord server name:
> FMR's basement

Enter your YouTube channel URL:
> https://www.youtube.com/channel/UCkvDYKFD2MjU1zqGuy1cSTA

Enter your Discord server invite link:
> https://discord.gg/3VszCHsxMc

Enter output directory (press Enter for current directory):
> ./my-awesome-page

🎉 Social media page generated successfully!
```

### Command Line Mode
```bash
./generate-social-page.sh "FMR" "FMR's basement" "https://youtube.com/@fmr" "https://discord.gg/abc123" "./output"
```

## 🎨 Customization

### Wallpaper Options

**Animated Gradients:**
- Teal Flow - Flowing teal to purple gradient
- Purple Dream - Deep purple animated gradient
- Sunset Glow - Warm sunset colors
- Ocean Breeze - Cool blue tones
- Fire Wave - Fiery red and orange
- Neon Nights - Vibrant neon colors
- Cosmic Flow - Space-inspired gradient
- Rainbow Shift - Multi-color spectrum

**Static Gradients:**
- Midnight - Dark professional theme
- Aurora - Purple and blue aurora
- Coral Reef - Warm coral tones
- Forest - Green nature theme
- Purple Haze - Static purple gradient
- Deep Space - Dark cosmic theme
- Golden Hour - Warm golden gradient
- Arctic Frost - Cool mint colors

### Manual Customization

After generation, you can manually edit:

- **`script.js`** - Update social links, profile data, or add new features
- **`style.css`** - Modify colors, animations, or layout
- **`index.html`** - Change structure or add new elements

## 🎯 Features Breakdown

### Particle System
- 80 animated particles flowing upward
- Color changes based on B&W mode
- Smooth performance with canvas rendering
- Glow effects for enhanced visual appeal

### Settings Panel
- Glass morphism design
- Live wallpaper preview
- Organized into animated and static sections
- Remembers user preferences with localStorage

### Social Media Integration
- Expandable buttons with smooth animations
- Custom hover tooltips
- Brand color preservation in B&W mode
- Keyboard navigation support

### Responsive Design
- Mobile-friendly layout
- Touch-optimized interactions
- Scalable elements (1.5x default size)
- Adaptive button expansion

## 📁 Generated Files

The script creates three files:

- **`index.html`** - Main HTML structure with your custom data
- **`style.css`** - Complete CSS with all animations and styles
- **`script.js`** - JavaScript with particle system and interactions

## 🌐 Browser Compatibility

- ✅ Chrome/Chromium (recommended)
- ✅ Firefox
- ✅ Safari
- ✅ Edge
- ⚠️ Internet Explorer (limited support)

## 🔧 Troubleshooting

### Script Won't Run
```bash
# If you downloaded files manually, make the script executable
chmod +x generate-social-page.sh

# Check if you have bash installed
bash --version
```

### Page Doesn't Load Properly
- Ensure all three files (HTML, CSS, JS) are in the same directory
- Check browser console for any errors
- Verify internet connection for Font Awesome icons

### Particles Not Showing
- Check if JavaScript is enabled in your browser
- Ensure the browser supports HTML5 Canvas
- Try refreshing the page

## 🎨 Color Scheme

The page uses a carefully crafted color palette:

- **Primary Colors:** Teal (#2dd4bf), Blue (#3b82f6), Purple (#8b5cf6)
- **Accent Colors:** YouTube Red (#ff0000), Discord Blue (#5865f2)
- **Glass Elements:** Semi-transparent white with backdrop blur
- **B&W Mode:** Monochrome with selective brand color highlights

## 📱 Mobile Experience

- Touch-friendly interface
- Optimized particle count for performance
- Responsive button sizing
- Smooth scroll behavior
- Adaptive layout for small screens

## 🚀 Performance

- Optimized particle rendering
- Efficient CSS animations
- Minimal JavaScript footprint
- Fast loading times
- Smooth 60fps animations

## 📄 License

This project is open source and available under the MIT License.

## 🤝 Contributing

Feel free to submit issues, feature requests, or pull requests to improve this project!

## 📞 Support

If you encounter any issues or have questions, please create an issue in the repository.

---

**Made with ❤️ for content creators and developers**