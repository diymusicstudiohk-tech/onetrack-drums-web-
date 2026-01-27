import { PageLayout, SharedLayout } from "./quartz/cfg"
import * as Component from "./quartz/components"

// components shared across all pages
export const sharedPageComponents: SharedLayout = {
  head: Component.Head(),
  header: [],
  afterBody: [],
  footer: Component.Footer({
    links: {
      "Onetrack Studio": "https://www.onetrackstudio.com",
    },
  }),
}

// components for pages that display a single page (e.g. a single note)
export const defaultContentPageLayout: PageLayout = {
  beforeBody: [
    // Component.Breadcrumbs() removed as per user request
    Component.ArticleTitle(),
    Component.ContentMeta(),
    Component.TagList(),
  ],
  left: [
    // Component.PageTitle() removed
    Component.MobileOnly(Component.Spacer()),
    Component.Flex({
      components: [
        // Component.Search() removed
        { Component: Component.Darkmode() },
        { Component: Component.ReaderMode() },
      ],
    }),
  ],
  right: [],
}

// components for pages that display lists of pages  (e.g. tags or folders)
export const defaultListPageLayout: PageLayout = {
  beforeBody: [
    // Component.Breadcrumbs() removed
    Component.ArticleTitle(), 
    Component.ContentMeta()
  ],
  left: [
    // Component.PageTitle() removed
    Component.MobileOnly(Component.Spacer()),
    Component.Flex({
      components: [
        // Component.Search() removed
        { Component: Component.Darkmode() },
      ],
    }),
  ],
  right: [],
}
