require 'nokogiri'

doc = File.open("oi3.xml") { |f| Nokogiri::XML(f) }

page_id = "topicId"

doc.xpath("//xmlns:resource-id").each{|res| res.name = "codeph"}
doc.xpath("//xmlns:list").each{|list| list.name = "ul"}
doc.xpath("//xmlns:list-item").each{|item| item.name = "li"}
doc.xpath("//xmlns:colspec").each{|colspec| colspec.remove }
doc.xpath("//xmlns:front").each{|front| front.remove }
doc.xpath("//xmlns:meta-data").each{|meta| meta.remove }
doc.xpath("//xmlns:tp").each{|tp| tp.name = "p"}
doc.xpath("//xmlns:row").each{|row| row.name = "strow"}
doc.xpath("//xmlns:title").each{|title| title.delete 'id'}

doc.xpath("//xmlns:doc").each do |doc|
	doc.delete('version')
	doc.delete('xmlns')
	doc.name = "topic"
	doc['id'] = page_id
end

doc.xpath("//xmlns:entry").each do |entry| 
	entry.name = "stentry" 
	entry.delete('valign')
end

doc.xpath("//xmlns:link").each do |link| 
	link.name = "xref"
	address = link['linkend']
	link['href'] = "##{page_id}/#{address}"
	link.delete('linkend')
end

doc.xpath("//xmlns:example").each{|example| example.name = "p"}
doc.xpath("//xmlns:preform").each do |preform| 
	preform.name = "codeph"
	preform.delete('boxed')
end

doc.xpath("//xmlns:caption").each do |caption|
	content = caption.content
	p_tag = Nokogiri::XML::Node.new "p", caption
	p_tag['id'] = caption['xml:id']
	i_tag = Nokogiri::XML::Node.new "i", p_tag
	i_tag.content = content
	caption.content = ""
	p_tag.add_child(i_tag)
	caption.parent.add_previous_sibling(p_tag)
	caption.remove()
end

doc.xpath("//xmlns:table").each do |table|
	table.delete('orient')
	table.name = "simpletable"
	table['relcolwidth'] = "1* 2*"
	table['frame'] = "all"
	table['expanse'] = "textline"
end

doc.xpath("//xmlns:thead").each do |thead|
	thead.parent.add_previous_sibling(thead)
	thead.name = "sthead"
	thead.children.each do |row| 
		thead.add_child(row.children)
		row.remove
	end
end

doc.xpath("//xmlns:tbody").each do |tbody|
	tbody.children.each do |row| 
		tbody.parent.add_previous_sibling(row)
	end
	tbody.parent.remove
	tbody.remove
end

doc.xpath("//xmlns:body").each do |body|
	body.parent.add_child body.children
	body.remove
end

doc.xpath("//xmlns:chl").each do |chl|
	topic = doc.xpath("//xmlns:topic").first
 	body = Nokogiri::XML::Node.new "body", topic
 	chl.children.each do |node|
 		if node.name.eql? "title"
 			topic.add_child node
 		else
 			body.add_child node
 		end
 	end
 	topic.add_child(body)
 	chl.remove
end

doc.xpath("//xmlns:doc").each do |doc|
	doc.remove
end

doc.remove_namespaces!

#DOC Type is fake one
#<!DOCTYPE topic PUBLIC "-//OASIS//DTD DITA Topic//EN" "topic.dtd">
doc.internal_subset.remove

system_id = "topic.dtd"
external_id = "-//OASIS//DTD DITA Topic//EN"

doc.create_internal_subset("topic", external_id, system_id)

doc.search('//processing-instruction("Pub")').each{|pub| pub.remove}

File.write("result2.xml", doc.to_xml)