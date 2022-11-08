require 'rdf/reasoner'
require 'rdf/turtle'

RDF::Reasoner.apply(:rdfs)
graph = RDF::Graph.load("etc/doap.ttl", format:  :ttl)
graph.entail(:subClassOf)
print(graph.enum_statement.entail.count) # >= graph.enum_statement.count

RDF::Turtle::Writer.open("etc/test.ttl") do |writer|
   writer << graph
end