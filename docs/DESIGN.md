---
name: Komorebi Design System
colors:
  surface: "#f8f9ff"
  surface-dim: "#cbdbf5"
  surface-bright: "#f8f9ff"
  surface-container-lowest: "#ffffff"
  surface-container-low: "#eff4ff"
  surface-container: "#e5eeff"
  surface-container-high: "#dce9ff"
  surface-container-highest: "#d3e4fe"
  on-surface: "#0b1c30"
  on-surface-variant: "#3c4a42"
  inverse-surface: "#213145"
  inverse-on-surface: "#eaf1ff"
  outline: "#6c7a71"
  outline-variant: "#bbcabf"
  surface-tint: "#006c49"
  primary: "#006c49"
  on-primary: "#ffffff"
  primary-container: "#10b981"
  on-primary-container: "#00422b"
  inverse-primary: "#4edea3"
  secondary: "#1b6b51"
  on-secondary: "#ffffff"
  secondary-container: "#a6f2d1"
  on-secondary-container: "#237157"
  tertiary: "#55615a"
  on-tertiary: "#ffffff"
  tertiary-container: "#99a69e"
  on-tertiary-container: "#303c36"
  error: "#ba1a1a"
  on-error: "#ffffff"
  error-container: "#ffdad6"
  on-error-container: "#93000a"
  primary-fixed: "#6ffbbe"
  primary-fixed-dim: "#4edea3"
  on-primary-fixed: "#002113"
  on-primary-fixed-variant: "#005236"
  secondary-fixed: "#a6f2d1"
  secondary-fixed-dim: "#8bd6b6"
  on-secondary-fixed: "#002116"
  on-secondary-fixed-variant: "#00513b"
  tertiary-fixed: "#d9e6dd"
  tertiary-fixed-dim: "#bdcac1"
  on-tertiary-fixed: "#131e19"
  on-tertiary-fixed-variant: "#3e4943"
  background: "#f8f9ff"
  on-background: "#0b1c30"
  surface-variant: "#d3e4fe"
  surface-paper: "#FFFFFF"
  surface-muted: "#F8FAFC"
  rating-again: "#EF4444"
  rating-hard: "#F59E0B"
  rating-good: "#3B82F6"
  rating-easy: "#10B981"
  kanji-stroke: "#1E293B"
typography:
  display-kanji:
    fontFamily: Plus Jakarta Sans
    fontSize: 48px
    fontWeight: "700"
    lineHeight: "1.2"
    letterSpacing: -0.02em
  display-kanji-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 36px
    fontWeight: "700"
    lineHeight: "1.2"
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 24px
    fontWeight: "600"
    lineHeight: 32px
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 20px
    fontWeight: "600"
    lineHeight: 28px
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: "400"
    lineHeight: 28px
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: "400"
    lineHeight: 24px
  body-sm:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: "400"
    lineHeight: 20px
  furigana:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: "500"
    lineHeight: 14px
    letterSpacing: 0.05em
  label-caps:
    fontFamily: JetBrains Mono
    fontSize: 12px
    fontWeight: "600"
    lineHeight: 16px
    letterSpacing: 0.05em
  rating-unit:
    fontFamily: JetBrains Mono
    fontSize: 11px
    fontWeight: "500"
    lineHeight: 12px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  container-margin: 1rem
  gutter: 1rem
  card-padding: 1.5rem
  stack-sm: 0.5rem
  stack-md: 1rem
  stack-lg: 2rem
---

## Brand & Style

The design system for J-Flashcard is built on the philosophy of "木漏れ日(こもれび)" (sunlight filtering through leaves)—representing clarity, growth, and the organic process of learning. The brand personality is **scholarly yet revitalizing**, balancing the rigorous nature of language acquisition with a fresh, encouraging interface.

The design style is **Modern Minimalist with Tactile accents**. It leverages heavy whitespace and a crisp typographic scale to reduce cognitive load during intense study sessions. Subtle shadows and "paper-like" surface tiers provide a sense of physicality, making the digital flashcards feel like tangible tools. The primary aesthetic goal is to disappear behind the content, allowing the intricate details of Kanji and Kana to take center stage.

**Target Audience:**

- Independent learners and students.
- Mobile-first users studying during commutes.
- Tech-savvy users who value efficiency and AI integration.

**Emotional Response:**

- Focus, calm, progress, and professional reliability.

## Colors

The palette is anchored by **Emerald Green**, chosen for its association with growth and its professional, "correct" connotation in educational contexts.

### Key Color Applications

- **Primary (#10B981):** Used for primary actions, progress bars, and the "Easy" rating. It signifies success and momentum.
- **Surface Layering:** We use a "Paper" strategy. The main background is a very light gray (`surface-muted`), while active cards and containers use pure white (`surface-paper`) to pop forward.
- **Semantic Ratings:**
  - **Again:** Vibrant Red for immediate attention.
  - **Hard:** Warm Amber for caution.
  - **Good:** Calm Blue for steady progress.
  - **Easy:** Emerald Green for mastery.
- **Typography:** Deep slate tones are used instead of pure black to reduce eye strain during long reading sessions.

## Typography

Typography prioritizes legibility across English, Korean, and Japanese scripts.

- **Display Kanji:** Used for the central word on the flashcard. It uses `Plus Jakarta Sans` for the Latin components, paired with a system-standard Japanese Gothic stack to ensure Kanji strokes are clear and balanced.
- **Furigana:** Specifically tuned to sit closely above Kanji without crowding, using a slightly tighter line height.
- **Labels:** `JetBrains Mono` is used for technical metadata (like Anki intervals or part-of-speech tags) to provide a "data-rich" feel that contrasts with the humanist body text.
- **Responsive Scaling:** Headline sizes drop significantly on mobile to ensure Kanji compounds do not wrap awkwardly.

## Layout & Spacing

This design system uses a **Fluid, Mobile-First Grid** logic.

### Layout Model

- **Mobile (< 640px):** Single column with `1rem` side margins. The flashcard occupies the full width minus margins to maximize "tap area" for ratings.
- **Tablet/Desktop:** A centered 12-column fixed-width grid (max-width 768px for the study interface) ensures that information remains scanable and doesn't stretch excessively, which is critical for reading short-form flashcard content.

### Spacing Rhythm

The system follows an 8px (0.5rem) base unit.

- **Flashcards:** Use `stack-lg` (32px) vertical breathing room between the word and the meaning.
- **Rating Bar:** Fixed at the bottom of the viewport on mobile, using a `0.5rem` gap between the four buttons to ensure high touch-target accuracy.

## Elevation & Depth

To create a "paper-on-desk" feel, we use **Tonal Layers** combined with **Ambient Shadows**.

1. **The Base (Level 0):** `surface-muted` (#F8FAFC) acts as the desk surface.
2. **The Card (Level 1):** Flashcards use a pure white background with a specific "Soft Shadow": `0 4px 6px -1px rgb(0 0 0 / 0.05), 0 2px 4px -2px rgb(0 0 0 / 0.05)`. This makes the card feel elevated and interactable.
3. **Active/Flip State:** When a card is "flipped," the shadow depth increases slightly to simulate the physical motion of being held closer to the user.
4. **Input Fields:** Use a low-contrast outline (1px solid #E2E8F0) and inset shadows when focused to create a "recessed" feel for data entry.

## Shapes

The shape language is **Rounded (0.5rem)**, conveying a friendly and approachable learning environment.

- **Standard Buttons & Inputs:** `rounded` (0.5rem) for a modern, soft touch.
- **Flashcards:** `rounded-xl` (1.5rem) to distinguish the primary learning object from UI controls.
- **Progress Bars:** Fully rounded (pill-shaped) to represent a continuous, smooth flow of learning.
- **Chips/Tags:** `rounded-lg` (1rem) for "Part of Speech" labels to make them look distinct from buttons.

## Components

### Flashcards

- **Front:** Center-aligned `display-kanji`.
- **Back:** Top-aligned `furigana` above the Kanji, followed by a `divider`, then the `meaning` in `body-lg`. Example sentences are contained in a `surface-muted` sub-block at the bottom.
- **Animation:** 3D Y-axis flip (duration: 300ms, timing: ease-in-out).

### Anki Rating Buttons

- Four-button horizontal group.
- **Structure:** Vertical stack containing an `icon` (optional), the `Rating Label` (e.g., "Good"), and the `Interval Label` (e.g., "1d") in `rating-unit`.
- **Styling:** Buttons use low-saturation versions of their semantic colors for the background, with high-saturation text, turning fully vibrant on hover/tap.

### Input Fields (AI-Assisted)

- Standard text fields with an "AI Sparkle" icon inside the trailing edge of the field when the AI autocomplete is active.
- Primary "AI Auto-fill" button uses a subtle gradient of `primary` to `secondary` to denote its "magical" functionality.

### Progress Indicators

- A slim line at the top of the flashcard screen.
- Segmented into three colors: Gray (New), Yellow (Learning), Green (Review).

### Deck Cards

- Summary view showing Deck Title, a progress ring, and count of "Due Today" cards in a high-contrast badge.
