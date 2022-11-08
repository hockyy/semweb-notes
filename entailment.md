<table>
<caption>RDF entailment pattern.</caption>
  <tbody>
    <tr>
      <th> </th>
      <th><strong>if S contains</strong></th>
      <th><strong>then S RDF entails, recognizing D</strong></th>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfd1">rdfD1</dfn></td>
      <td class="othertable">   xxx aaa <code>"</code>sss<code>"^^</code>ddd <code>.</code> <br>
          for ddd in D</td>
      <td class="othertable">xxx aaa _:nnn <code>.</code><br>
_:nnn <code>rdf:type</code> ddd <code>.</code></td>
   </tr>
  </tbody>
</table>

<table>
  <tbody>
    <tr>
      <th> </th>
      <th><strong>if S contains</strong></th>
      <th><strong>then S RDF entails, recognizing D</strong></th>
    </tr>
    <tr>
       <td class="othertable"><dfn id="dfn-rdfd2">rdfD2</dfn></td>
       <td class="othertable">xxx aaa yyy <code>.</code></td>
       <td class="othertable">aaa <code>rdf:type rdf:Property .</code> </td>
    </tr>
  </tbody>
</table>

<table>
<caption>RDFS entailment patterns.</caption>
  <tbody>
    <tr>
      <th></th>
      <th>If S contains:</th>
      <th>then S RDFS entails recognizing D:</th>
    </tr>
    <tr>
     <td class="othertable"><dfn id="dfn-rdfs1">rdfs1</dfn></td>
     <td class="othertable">any IRI aaa in D</td>
     <td class="othertable">aaa <code>rdf:type rdfs:Datatype . </code></td>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfs2">rdfs2</dfn></td>
      <td class="othertable"> aaa <code>rdfs:domain</code> xxx <code>.</code><br>
          yyy aaa zzz <code>.</code></td>
      <td class="othertable">yyy <code>rdf:type</code> xxx <code>.</code></td>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfs3">rdfs3</dfn></td>
      <td class="othertable">aaa <code>rdfs:range</code> xxx <code>.</code><br>
          yyy aaa zzz <code>.</code></td>
      <td class="othertable">zzz <code>rdf:type</code> xxx <code>.</code></td>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfs4a">rdfs4a</dfn></td>
      <td class="othertable">xxx aaa yyy <code>.</code></td>
      <td class="othertable">xxx <code>rdf:type rdfs:Resource .</code></td>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfs4b">rdfs4b</dfn></td>
      <td class="othertable">xxx aaa yyy<code>.</code></td>
      <td class="othertable">yyy <code>rdf:type rdfs:Resource .</code></td>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfs5">rdfs5</dfn></td>
      <td class="othertable"> xxx <code>rdfs:subPropertyOf</code> yyy <code>.</code><br>
          yyy <code>rdfs:subPropertyOf</code> zzz <code>.</code></td>
      <td class="othertable">xxx <code>rdfs:subPropertyOf</code> zzz <code>.</code></td>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfs6">rdfs6</dfn></td>
      <td class="othertable">xxx <code>rdf:type rdf:Property .</code></td>
      <td class="othertable">xxx <code>rdfs:subPropertyOf</code> xxx <code>.</code></td>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfs7">rdfs7</dfn></td>
      <td class="othertable"> aaa <code>rdfs:subPropertyOf</code> bbb <code>.</code><br>
          xxx aaa yyy <code>.</code></td>
      <td class="othertable">xxx bbb yyy <code>.</code></td>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfs8">rdfs8</dfn></td>
      <td class="othertable">xxx <code>rdf:type rdfs:Class .</code></td>
      <td class="othertable">xxx <code>rdfs:subClassOf rdfs:Resource .</code></td>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfs9">rdfs9</dfn></td>
      <td class="othertable">xxx <code>rdfs:subClassOf</code> yyy <code>.</code><br>
          zzz <code>rdf:type</code> xxx <code>.</code></td>
      <td class="othertable">zzz <code>rdf:type</code> yyy <code>.</code></td>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfs10">rdfs10</dfn></td>
      <td class="othertable">xxx <code>rdf:type rdfs:Class .</code></td>
      <td class="othertable">xxx <code>rdfs:subClassOf</code> xxx <code>.</code></td>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfs11">rdfs11</dfn></td>
      <td class="othertable"> xxx <code>rdfs:subClassOf</code> yyy <code>.</code><br>
          yyy <code>rdfs:subClassOf</code> zzz <code>.</code></td>
      <td class="othertable">xxx <code>rdfs:subClassOf</code> zzz <code>.</code></td>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfs12">rdfs12</dfn></td>
      <td class="othertable">xxx <code>rdf:type rdfs:ContainerMembershipProperty .</code></td>
      <td class="othertable">xxx <code>rdfs:subPropertyOf rdfs:member .</code></td>
    </tr>
    <tr>
      <td class="othertable"><dfn id="dfn-rdfs13">rdfs13</dfn></td>
      <td class="othertable">xxx <code>rdf:type rdfs:Datatype .</code></td>
      <td class="othertable">xxx <code>rdfs:subClassOf rdfs:Literal .</code></td>
    </tr>
  </tbody>
</table>
```
rdf:type rdf:type rdf:Property .
rdf:subject rdf:type rdf:Property .
rdf:predicate rdf:type rdf:Property .
rdf:object rdf:type rdf:Property .
rdf:first rdf:type rdf:Property .
rdf:rest rdf:type rdf:Property .
rdf:value rdf:type rdf:Property .
rdf:nil rdf:type rdf:List .
rdf:_1 rdf:type rdf:Property .
rdf:_2 rdf:type rdf:Property .

rdf:type rdfs:domain rdfs:Resource .
rdfs:domain rdfs:domain rdf:Property .
rdfs:range rdfs:domain rdf:Property .
rdfs:subPropertyOf rdfs:domain rdf:Property .
rdfs:subClassOf rdfs:domain rdfs:Class .
rdf:subject rdfs:domain rdf:Statement .
rdf:predicate rdfs:domain rdf:Statement .
rdf:object rdfs:domain rdf:Statement .
rdfs:member rdfs:domain rdfs:Resource .
rdf:first rdfs:domain rdf:List .
rdf:rest rdfs:domain rdf:List .
rdfs:seeAlso rdfs:domain rdfs:Resource .
rdfs:isDefinedBy rdfs:domain rdfs:Resource .
rdfs:comment rdfs:domain rdfs:Resource .
rdfs:label rdfs:domain rdfs:Resource .
rdf:value rdfs:domain rdfs:Resource .

rdf:type rdfs:range rdfs:Class .
rdfs:domain rdfs:range rdfs:Class .
rdfs:range rdfs:range rdfs:Class .
rdfs:subPropertyOf rdfs:range rdf:Property .
rdfs:subClassOf rdfs:range rdfs:Class .
rdf:subject rdfs:range rdfs:Resource .
rdf:predicate rdfs:range rdfs:Resource .
rdf:object rdfs:range rdfs:Resource .
rdfs:member rdfs:range rdfs:Resource .
rdf:first rdfs:range rdfs:Resource .
rdf:rest rdfs:range rdf:List .
rdfs:seeAlso rdfs:range rdfs:Resource .
rdfs:isDefinedBy rdfs:range rdfs:Resource .
rdfs:comment rdfs:range rdfs:Literal .
rdfs:label rdfs:range rdfs:Literal .
rdf:value rdfs:range rdfs:Resource .

rdf:Alt rdfs:subClassOf rdfs:Container .
rdf:Bag rdfs:subClassOf rdfs:Container .
rdf:Seq rdfs:subClassOf rdfs:Container .
rdfs:ContainerMembershipProperty rdfs:subClassOf rdf:Property .

rdfs:isDefinedBy rdfs:subPropertyOf rdfs:seeAlso .

rdfs:Datatype rdfs:subClassOf rdfs:Class .

rdf:_1 rdf:type rdfs:ContainerMembershipProperty .
rdf:_1 rdfs:domain rdfs:Resource .
rdf:_1 rdfs:range rdfs:Resource .
rdf:_2 rdf:type rdfs:ContainerMembershipProperty .
rdf:_2 rdfs:domain rdfs:Resource .
rdf:_2 rdfs:range rdfs:Resource .

```

