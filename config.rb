###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration


# github deploy
activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.build_before = true
  deploy.branch   = "master"
  deploy.remote   = "git@github.com:shukerov/shukerov.github.io.git"
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

# enabling redcarpet as markdown parser
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true

# activate live reloading on save
activate :livereload

# # activate blog
# activate :blog do |blog|
#   # set options on blog
#   # relative path for new blogs via cmdl
#   #blog.new_article_template
#   blog.prefix = "posts"
#   blog.sources = "test.html.markdown"
# end

activate:blog do |blog|
  
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "blog"
  blog.permalink = "{year}/{month}/{day}/{title}.html"
  
  # Matcher for blog source files
  blog.sources = "articles/{year}-{month}-{day}-{title}.html"
  blog.taglink = "tags/{tag}.html"
  blog.layout = "layouts/blog"
  # blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  # blog.year_link = “{year}.html"
  # blog.month_link = “{year}/{month}.html"
  # blog.day_link = “{year}/{month}/{day}.html"
  blog.default_extension = ".markdown"
  blog.new_article_template = "layouts/post"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  
  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end
