import { defineConfig } from 'astro/config'
import react from '@astrojs/react'

export default defineConfig({
    site: 'https://raj8664.github.io',
    base: '/nvim-config',
    integrations: [react()],
    output: 'static',
})
