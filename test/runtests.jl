using Test
using GenHTML
import GenHTML:html, p, a, div, h1, h2, h3, h4, ul, li, meta, title, head, header, footer, link, body, linkall!, parallel!
using EzXML

function test_001()
    a1 = p("aaa", "class"=>"fuga", "id"=>"hoge")
    a2 = html("aaa", "class"=>"fuga", "id"=>"hoge")
    @test a1["class"] == "fuga"
    @test a2["id"] == "hoge"
    # @show nodecontent(x)
    c = linkall!(a1, a2)
    prettyprint(c)
end

include(joinpath(@__DIR__, "card.jl"))
function test_002()
    card_0 = card("localhost:8080", "タイトル")
    f_out = joinpath(@__DIR__, "card.html")
    open(f_out, "w") do f; prettyprint(f, card_0) end;
end

include(joinpath(@__DIR__, "category.jl"))
function test_003()
    category_html = linkall!(
        html(),
        category(["hoge", "fuga", "Julia", "aaa"])
    )
    f_out = joinpath(@__DIR__, "category.html")
    open(f_out, "w") do f; prettyprint(f, category_html) end;
end

include(joinpath(@__DIR__, "mainbox.jl"))
function test_004()
    categories = category(["hoge", "fuga", "Julia", "aaa"])
    mainpage = h1("hogehoge")
    mainbox_xml = mainbox(mainpage, categories)
    f_out = joinpath(@__DIR__, "index.html")
    open(f_out, "w") do f; prettyprint(f, mainbox_xml) end;
end

include(joinpath(@__DIR__, "full-html.jl"))
function test_005()
    category_html::GenHTML.ParallelNode = category(["hoge", "fuga", "Julia", "aaa"])
    mainpage = h1("hogehoge")
    # これをdocumentへ埋め込む
    mainbox_xml = allhtmldoc(mainpage)
    f_out = joinpath(@__DIR__, "index2.html")
    open(f_out, "w") do f; prettyprint(f, mainbox_xml) end;
end

include(joinpath(@__DIR__, "image-test.jl"))


# test_001()
# test_002()
# test_003()
# test_004()
# test_005()


