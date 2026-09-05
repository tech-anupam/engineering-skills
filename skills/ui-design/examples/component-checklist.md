## Reusable component checklist — when to extract a component:
- **Navbar**: Always reusable. One navbar component, conditionally rendered per route if needed.
- **Footer**: Always reusable.
- **Button**: Always reusable. Use variants (primary, secondary, ghost, destructive) via props.
- **Form fields**: Reusable input, textarea, select, checkbox, radio components. Never recreate form markup.
- **Card**: Reusable with slots/children for flexible content.
- **Dialog/Modal**: One dialog component, content passed as children.
- **Navigation/Sidebar**: Reusable, data-driven from a config array.
- **Toast/Notification**: Single notification system, not per-page implementations.
- **Loading states**: One skeleton/spinner component, not ad-hoc loading UIs.
- **Layout wrappers**: Page layout, section containers, grid wrappers.

**Rule of thumb**: If it appears twice, extract it. If it might appear twice, plan for extraction.
