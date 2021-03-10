### Explanation

This is a simple rails app with hotwire installed to demonstrate a potential
caching issue as outlined [here](https://github.com/hotwired/turbo/issues/193)

### Setup

```
bin/setup
rails s
# and in a separate terminal window:
bin/webpack-dev-server
```

### Steps

1) Navigate to localhost:3000/posts/new
2) Create an unpublished post
3) Click 'Publish' button on the post show page taking you to the index page
4) Click the back button in the browser

### Expected Behavior

The post show page should not be cached and show the "Unpublish" button.

### Actual Behavior

The post show page has the cached "Publish" button still visible. Refreshing the
page corrects the button to show "Unpublish".

Also if you click the "Show" link from the index page you will see a quick
flicker on the button as it loads the cached page and then quickly replaces it.

### Additional Notes

Putting a console log at
node_modules/@hotwired/turbo/dist/turbo.es2017-esm.js#l2108 confirms that the
call to `this.view.clearSnapshotCache()` happens.
