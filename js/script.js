var onSaxonLoad = function() {
    Saxon.setLogLevel("INFO");
    var xsl = Saxon.requestXML("test/fn.bbox/bbox.xsl")
    var proc = Saxon.newXSLT20Processor(xsl);
    proc.setParameter(null, 'format', 'hocr');
    proc.setParameter(null, 'id', 'block_1_1');
    var xml = Saxon.requestXML("test/fn.bbox/hocr.input.xml")
    console.log(proc.transformToDocument(xml));
    console.log(proc.transformToDocument(xml));
    console.log(proc.transformToDocument(xml));
}
