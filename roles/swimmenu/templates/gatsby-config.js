module.exports = {
  siteMetadata: {
    title: `Swim Menu`,
    description: `Menu Pager `,
    author: `@hias222`,
    siteURL: 'https://{{ nginx_domain_name }}',
    siteUnsecureURL: 'http://{{ nginx_domain_name }}',
    menuLinks: [
      {
        name: 'index',
        link: '/'
      },
      {
        name: 'control',
        link: '/control'
      },
      {
        name: 'overlay',
        link: '/overlay'
      }
    ]
  },
  plugins: [
    `gatsby-plugin-react-helmet`,
    `gatsby-plugin-image`,
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        name: `images`,
        path: `${__dirname}/src/images`,
      },
    },
    `gatsby-transformer-sharp`,
    `gatsby-plugin-sharp`,
    {
      resolve: `gatsby-plugin-manifest`,
      options: {
        name: `swimmenu`,
        short_name: `menu`,
        start_url: `/swimmenu/`,
        background_color: `#663399`,
        theme_color: `#663399`,
        display: `minimal-ui`,
        icon: `src/images/gatsby-icon.png`, // This path is relative to the root of the site.
      },
    },
    `gatsby-plugin-gatsby-cloud`,
    // this (optional) plugin enables Progressive Web App + Offline functionality
    // To learn more, visit: https://gatsby.dev/offline
    // `gatsby-plugin-offline`,
  ],
  pathPrefix: `/swimmenu`,

}
