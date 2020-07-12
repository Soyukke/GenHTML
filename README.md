# GenHTML

Generate HTML code

## Example



```julia
using GenHTML
p("hoge", "id"=>"hoge")
```

```html
<p id="hoge">hoge</p>
```

```julia
linkall!(
    html(),
    div(),
    p("aaa")
)
```

```html
<html>
    <div>
        <p>aaa</p>
    </div>
</html>
```