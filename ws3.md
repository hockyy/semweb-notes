### Nomor 1

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT * WHERE {
  {
    SELECT (?class as ?barang) ("class" as ?jenis) (COUNT(?instance) AS ?hitungBarang) WHERE {
      {
        SELECT DISTINCT ?class WHERE {
          {
            [ a ?class ]
          } UNION {
            [ rdfs:subClassOf ?class ]
          } UNION {
            ?class rdfs:subClassOf []
          } UNION {
            [ rdfs:domain ?class ]
          } UNION {
            [ rdfs:range ?class ]
          }
        }
      }
      # Simbol asterisk untuk mengecek 0 atau lebih rantai
      ?subclass rdfs:subClassOf* ?class .
      ?instance a ?subclass .
    }
    GROUP by ?class
  } UNION {
    SELECT (?prop as ?barang) ("property" as ?jenis) (COUNT(*) AS ?hitungBarang) WHERE {
      # Menggunakan blank node untuk menghitung banyaknya pasangan yang cocok
      [] ?prop []
    }
    GROUP BY ?prop
  }
}
```

## Nomor 2

Berdasarkan query berikut:

```SPARQL
PREFIX : <http://domain.org/ns/>

SELECT (COUNT(DISTINCT *) as ?tanggalDouble) WHERE {
  ?album :date ?tanggal .
	?album :date ?tanggal2 .
  FILTER (?tanggal < ?tanggal2)
}
ORDER BY ?tanggal
```

Terdapat beberapa album yang tanggal nya lebih dari satu, diasumsikan tanggal rilis merupakan tanggal yang paling kecil untuk setiap property `:date` pada sebuah album. Untungnya, setiap album memiliki setidaknya satu properti `:date`.

```sparql
PREFIX : <http://domain.org/ns/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT * WHERE {
  ?album rdf:type :Album .
  OPTIONAL {
    ?album :name ?namaAlbum .
  }
  FILTER (!BOUND(?namaAlbum))
}
ORDER BY ?album
```

Berdasarkan query di atas, diketahui ada satu album bernama X dari Ed Sheeran yang tidak memiliki properti nama album. Sehingga ditulis query sebagai berikut.

```SPARQL
PREFIX : <http://domain.org/ns/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT ?artis ?namaArtis ?jenisArtis ?album ?namaAlbum ?tanggal WHERE {
  ?jenisArtis rdfs:subClassOf :Artist .
  ?artis a ?jenisArtis .
  ?artis :name ?namaArtis
  OPTIONAL {
    ?album :artist ?artis .
    ?album a :Album .
    ?album :date ?tanggal .
    OPTIONAL { ?album :name ?namaAlbum }
  }
  FILTER (
    NOT EXISTS
    {
      ?album :date ?tanggalLain
      FILTER (?tanggal > ?tanggalLain)
    } || !BOUND(?album)
  )
}
ORDER BY ?tanggal
```

### Nomor 3

```sparql
PREFIX : <http://domain.org/ns/>

SELECT * WHERE {
  # Mencari band dan solo artis membernya
  ?band a :Band .
  ?band :member ?soloArtis .
  ?band :name ?namaBand .
  ?soloArtis a :SoloArtist .
  ?soloArtis :name ?namaSoloArtis .
}
ORDER BY ?namaBand ?namaSoloArtis
# Urutkan berdasarkan nama band, kemudian nama solo artis
```

### Nomor 4

```sparql
PREFIX : <http://domain.org/ns/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

SELECT ?namaArtis ?namaAlbum ?tanggal WHERE {
  ?artis :name ?namaArtis .
  ?artis a :SoloArtist .
  ?album :producer ?artis .
  ?album :artist ?artis .
  ?album a :Album .
  ?album :date ?tanggal .
  OPTIONAL { ?album :name ?namaAlbum } .
  FILTER (?tanggal >= "1970-01-01"^^xsd:date && ?tanggal < "1980-01-01"^^xsd:date)
  FILTER NOT EXISTS {
    ?album :date ?tanggalLain
    FILTER (?tanggal > ?tanggalLain)
  }
}
```

### Nomor 5

```sparql
PREFIX : <http://domain.org/ns/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

# Aggregation dengan group album artis tanggal
SELECT DISTINCT ?album ?artis ?tanggal (COUNT(?lagu) as ?laguCount) WHERE {
  ?artis :name ?namaArtis .
  ?artis a :Band .
  ?album :artist ?artis .
  ?album a :Album .
  ?album :producer ?produser .
  ?album :date ?tanggal .
  #  Mengecek semua lagu pada album ini
  ?album :track ?lagu .
  #  Left join dengan nama album
  OPTIONAL { ?album :name ?namaAlbum } .
  FILTER (?tanggal >= "1980-01-01"^^xsd:date && ?tanggal < "1990-01-01"^^xsd:date)
  FILTER NOT EXISTS {
    ?album :date ?tanggalLain # Mengecek tanggal terkecil
    FILTER (?tanggal > ?tanggalLain)
  }
  #  Mengecek produsernya merupakan artis (band) atau membernya langsung
  FILTER (?produser = ?artis ||
          EXISTS { ?artis :member ?produser . }
  )
}
GROUP BY ?album ?artis ?tanggal
```

## Nomor 6

```sparql
PREFIX : <http://domain.org/ns/>

SELECT ?penulis ?banyakTulisan ?countAlbum {
  {
    # Mencari penulis dengan jumlah lagu terbanyak
    SELECT ?penulis (COUNT(?lagu) as ?banyakTulisan) WHERE {
      ?lagu a :Song .
      ?lagu :writer ?penulis
    }
    GROUP BY ?penulis
    ORDER BY DESC(?banyakTulisan) # Limit ke 10 teratas saja setelah diurutkan
    LIMIT 10
  }
  {
    # Join dengan kontribusinya terhadap album
    SELECT (?penulis2 as ?penulis) (COUNT(?album) as ?countAlbum) WHERE {
      {
        SELECT DISTINCT ?penulis2 ?album WHERE {
          ?lagulain :writer ?penulis2 .
          ?album :track ?lagulain
        }
        ORDER BY ?penulis2
      }
    }
    GROUP BY ?penulis2
  }
}
ORDER BY DESC(?banyakTulisan)
```

## Nomor 7

```sparql
PREFIX : <http://domain.org/ns/>

SELECT * WHERE {
  {
    # Mencari jumlah anggota untuk semuanya
    SELECT ?band ?namaBand (COUNT(?anggota) AS ?anggotaCount) WHERE {
      ?band a :Band .
      ?band :member ?anggota .
      ?band :name ?namaBand .
    }
    GROUP BY ?band ?namaBand
  }
  #  Filter untuk anggotanya >= 5 saja
  FILTER (?anggotaCount >= 5)
}
```

## Nomor 8

```SPARQL
PREFIX : <http://domain.org/ns/>

SELECT ?judulAlbum ?judulLagu ?namaArtis ?panjangLagu ?paraPenulis WHERE {
  ?album :artist ?artis .
  ?album :name ?judulAlbum .
  ?artis :name ?namaArtis .
  {
    # Mencari semua data lagu dengan panjang dan concat dari penulisnya
    SELECT ?album ?lagu ?judulLagu ?panjangLagu (GROUP_CONCAT(
                                                   ?namaPenulis;SEPARATOR=", ") AS ?paraPenulis) WHERE {
      ?album :track ?lagu .
      ?lagu :writer ?penulis .
      ?penulis :name ?namaPenulis .
      ?lagu :length ?panjangLagu .
      ?lagu :name ?judulLagu
    }
    GROUP BY ?album ?lagu ?judulLagu ?panjangLagu
  }
  #  Melakukan filter untuk mengecek apakah tidak ada lagu yang lebih panjang dari pada dia
  FILTER ((NOT EXISTS
           {
             ?album :track ?laguLain .
             ?laguLain :length ?panjangLaguLain .
             ?laguLain :name ?judulLaguLain .
             FILTER (
               ?panjangLaguLain > ?panjangLagu ||
               (?panjangLaguLain = ?panjangLagu && ?judulLaguLain > ?judulLagu )
             )
           }
          ) ||
            #  Melakukan filter untuk mengecek apakah tidak ada lagu yang lebih pendek dari pada dia
          (NOT EXISTS
           {
             ?album :track ?laguLain .
             ?laguLain :length ?panjangLaguLain .
             ?laguLain :name ?judulLaguLain .
             FILTER (
               ?panjangLaguLain < ?panjangLagu ||
               (?panjangLaguLain = ?panjangLagu && ?judulLaguLain < ?judulLagu )
             )
           }
          )
  )

}
ORDER BY ?panjangLagu # Urut berdasarkan panjang lagu
```

