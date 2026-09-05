# Icon Libraries Reference

## Comparison

| Library | Icons | Style | Tree-shake | React Package | Size | Best For |
|---|---|---|---|---|---|---|
| Lucide | 1500+ | Outline/Stroke | Yes | lucide-react | ~2KB per icon | React/Next.js default |
| Font Awesome | 7000+ | Solid/Regular/Brands | Partial | @fortawesome/react-fontawesome | Varies | Needs extensive coverage |
| Material Icons | 2500+ | Filled/Outlined/Rounded | Yes | @mui/icons-material | ~2KB per icon | Material 3 / Android consistency |
| Heroicons | 300+ | Outline/Solid | Yes | @heroicons/react | ~1KB per icon | Tailwind UI projects |
| Phosphor | 7000+ | 6 weights | Yes | @phosphor-icons/react | ~2KB per icon | Design flexibility |
| Tabler | 5000+ | Outline | Yes | @tabler/icons-react | ~1KB per icon | Dashboard/admin UIs |

## Installation and Usage (React/Next.js)

### Lucide
```tsx
import { Search, Menu, X } from 'lucide-react'
```

### Font Awesome
```tsx
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
```

### Material Icons
```tsx
import SearchIcon from '@mui/icons-material/Search'
```

## Accessibility Checklist

- Decorative icons: `aria-hidden="true"`
- Functional icons (buttons): `aria-label="description"`
- Icon + text: icon is decorative, text provides meaning
- Color contrast: icons must meet WCAG AA contrast ratio
