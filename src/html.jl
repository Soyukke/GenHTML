using EzXML

struct ParallelNode
    nodes::Vector{EzXML.Node}
end

for fname in (:html, :a, :p, :div, :h1, :h2, :h3, :h4, :ul, :li, :meta, :title, :link, :head, :body, :header, :footer, :script)
    @eval begin
        # p(), html()... 
        function $(fname)(text::T, attrs::Vararg{Pair{T, T}}) where T <: AbstractString
            node = ElementNode($(string(fname)))
            link!(node, TextNode(text))
            for attr in attrs
                node[attr.first] = attr.second
            end
            return node
        end

        function $(fname)(attrs::Vararg{Pair{T, T}}) where T <: AbstractString
            node = ElementNode($(string(fname)))
            for attr in attrs
                node[attr.first] = attr.second
            end
            return node
        end
    end
end

"""
すべてのノードを直列接続する
ParallelNode型は直前のノードに全てのノードを接続する
"""
function linkall!(nodes::Vararg{Union{EzXML.Node, ParallelNode}})::EzXML.Node
    for i in 1:length(nodes)-1
        parentnode = nodes[i]
        childnode = nodes[i+1]
        if isa(childnode, EzXML.Node)
            link!(parentnode, childnode)
        elseif isa(childnode, ParallelNode)
            for node in childnode.nodes
                link!(parentnode, node)
            end
        end
    end
    return first(nodes)
end

"""
Parallelノード型. これ単体ではxmlをなさない．親ノードとlinkall!することで
親ノードにすべてのノードが接続される
"""
function parallel!(nodes::Vararg{EzXML.Node})::ParallelNode
    return ParallelNode([nodes...])
end
