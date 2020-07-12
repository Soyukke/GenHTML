
function allhtmldoc(mainpage::EzXML.Node)
    node_html = linkall!(
        html(),
        parallel!(
            head(),
            header(),
            linkall!(body(), mainpage),
            footer()
        )
    )

    doc = XMLDocument()
    setroot!(doc, node_html)
    return doc
end