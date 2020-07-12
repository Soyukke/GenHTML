"""
htmlを入れる箱のhtml
- メインページ
- カテゴリー

## Examples
```julia
card("localhost:8080/hoge", "タイトル")
```

### html

```html
<a class="btn" href=\$uri>
<div class="card">
    <div class="title">
        <h2>\$title</h2>
    </div>
    <div class="subinfo">
        <p>\$subinfo</p>
    </div>
</div>
</a>
```
"""
function mainbox(mainpage::EzXML.Node, categories::GenHTML.ParallelNode)
    return linkall!(
        div(:class=>"mainbox"),
        parallel!(
            linkall!(
                div(:class=>"frame main left")
            ),
            linkall!(
                div(:class=>"frame main content"),
                p("created_at"),
                mainpage
            ),
            linkall!(
                div(:class=>"frame main right"),
                categories
            )
        )
)
end