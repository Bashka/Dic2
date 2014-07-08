Примеры
Примеры
=======

Документ с одним корневым элементом типа 'string':

    XSD:
    <?xml version="1.0" encoding="UTF-8"?>
    <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xs:element name="root" type="xs:string"/>
    </xs:schema>
    
    XML:
    <?xml version="1.0" encoding="UTF-8"?>
    <root>Hello world</root>

Расширение типа 'string':

    XSD:
    <?xml version="1.0" encoding="UTF-8"?>
    <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xs:element name="root" type="mySimpleType"/>
      <xs:simpleType name="mySimpleType">
        <xs:restriction base="xs:string">
          <xs:pattern value="[0-9]{4}-[0-9]{2}"/>
        </xs:restriction>
      </xs:simpleType>
    </xs:schema>

    XML:
    <?xml version="1.0" encoding="UTF-8"?>
    <root>1234-56</root>

Создание сложного типа с 2 вложенными узлами:

    XSD:
    <?xml version="1.0" encoding="UTF-8"?>
    <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xs:element name="root">
        <xs:complexType>
          <xs:sequence>
            <xs:element name="foo" type="xs:string"/>
            <xs:element name="bar" type="xs:string"/>
          </xs:sequence>
        </xs:complexType>
      </xs:element>
    </xs:schema>

    XML:
    <?xml version="1.0" encoding="UTF-8"?>
    <root><foo>A</foo><bar>B</bar></root>
    
