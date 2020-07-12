"""
カテゴリー表示用のhtmlを生成する

```julia
category("localhost:8080/hoge", "タイトル")
```

### html

ヘッダー部分
```html
<div class="heading">
    <p>カテゴリー</p>
</div>
```

カテゴリー繰り返し表示部分
```html
<ul>
    <%
    @foreach(@vars(:categories)) do category
    "<a class=\"btn\" href=\$category_page_link><li>\$category_name</li></a>"
    end
    %>
    <a class="btn" href="/profile"><li>プロフィール</li></a>
</ul>
</div>
```
"""

function category(names::Vector{T}) where T <: AbstractString
    return parallel!(
        category_header(),
        linkall!(
            ul(),
            parallel!(category_detail.("hoge", names)...)
        )
    )
end

function category_header(title="カテゴリー")
    return linkall!(
        div(:class=>"heading"),
        p("カテゴリー")
    )
end


"""
```html
"<a class="btn" href=\$url>
    <li>\$category_name</li>
</a>"
```
"""
function category_detail(url, name::AbstractString)
    return linkall!(
        a(:class=>"btn", :href=>url),
        li(name)
    )
end