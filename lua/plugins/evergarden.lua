require('evergarden').setup({
  theme = {
    variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
    accent = 'green',
  },
  editor = {
    transparent_background = true,
    sign = { color = 'none' },
    float = {
      color = 'mantle',
      solid_border = false,
    },
    completion = {
      color = 'surface0',
    },
  },
})
