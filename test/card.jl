# import GenHTML:html, p, a, div, linkall!
# using EzXML

"""
Cardのようなhtmlを生成する

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
function card(uri::AbstractString, title::AbstractString)
    return linkall!(
        a(:class=>"btn", :href=>uri),
        div(:class=>"card"),
        linkall!(
            div(:class=>"title"),
            h1(title)
        ),
        linkall!(
            div(:class=>"subinfo"),
            p("subinfo")
        ),
    )
end