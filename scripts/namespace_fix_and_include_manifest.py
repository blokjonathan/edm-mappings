import xml.etree.ElementTree as ET

import os

# Step 1: Add missing namespaces
# Step 2: Extract PID
# Step 3: Add 'Service'-element with link to manifest
# Step 3: Add sub-elements

# sed -i -E "s/ns1/ns_1/g" *.xml
# sed -i -E "s/ns4/ns_4/g" *.xml

path = '../harvest/'
rdf_about = 'rdf:about'
rdf_resource = 'rdf:resource'
iiif_image_api = 'http://iiif.io/api/image'
iiif_level2_api = 'http://iiif.io/api/image/2/level2.json'

namespaces = {
             'dc': 'http://purl.org/dc/elements/1.1/',
             'dcterms': 'http://purl.org/dc/terms/',
             'ns_1': 'http://www.europeana.eu/schemas/edm/',
             'ns_4': 'http://www.openarchives.org/ore/terms/',
             'rdf': 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
             'xmlns:doap': 'http://usefulinc.com/ns/doap#',
             'xmlns:svcs': 'http://rdfs.org/sioc/services#'
              }

for namespace_definition in namespaces:
    ET.register_namespace(namespace_definition, namespaces[namespace_definition])

for filename in os.listdir(path):
    if not filename.endswith('.xml'): continue
    fullname = os.path.join(path, filename)
    tree = ET.parse(fullname)

    root = tree.getroot()
    root.set('xmlns:svcs', 'http://rdfs.org/sioc/services#')
    root.set('xmlns:doap', 'http://usefulinc.com/ns/doap#')

    service_element = ET.Element("svcs:Service")
    conforms_to_element = ET.Element("dcterms:conformsTo")
    implements_element = ET.Element("doap:implements")

    manifest_link = 'https://gallica.bnf.fr/iiif/ark:/12148/bpt6k4773206h/f1'
    aggregation_element = root.find('ns_4:Aggregation', namespaces)
    has_view_element = aggregation_element.find('ns_1:hasView', namespaces)
    print(has_view_element.attrib)

    service_element.set(rdf_about, manifest_link)
    conforms_to_element.set(rdf_resource, iiif_image_api)
    implements_element.set(rdf_resource, iiif_level2_api)

    service_element.insert(0, conforms_to_element)
    service_element.insert(1, implements_element)
    root.insert(2, service_element)

    #elem_rights = root.find('europeana:rights', namespaces)
    #elem_rights.text = mapping_list[elem_rights.text]

    tree.write(filename)


