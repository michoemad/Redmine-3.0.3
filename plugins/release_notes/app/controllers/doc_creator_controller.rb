require 'webrick'
require 'stringio'
class DocCreatorController < ApplicationController
 unloadable


  def index
    @notes = Note.all

  end


  def new
  	#fail
  	@project = Project.find(params[:project_id])
  	@users = User.all


  end

  def create
  	x = Net::HTTP.post_form(URI('http://192.168.99.11:8100/createLatexDoc'),params)

	tempfile = Tempfile.new('new.pdf')
 	File.open(tempfile.path,'wb') do |f|
       f.write x.body
   end
   file_name = x['content-disposition'][/filename(.*)/][10..-2]

	@project = Project.find(params[:project_id])
	
  	#send_file tempfile.path, filename: file_name
    # @document = @project.documents.build
    # @document.safe_attributes = ({"title"=> file_name})
    # attach = {"1"=>{"filename"=>file_name, "description"=>""}}
    # attach['file']= tempfile
    # @document.save_attachments(attach)
    @attachment = Attachment.new(:file => tempfile)
    @attachment.author = User.current
    @attachment.filename = file_name
    #@attachment.content_type = params[:content_type].presence
    k = @attachment.save
    @note = Note.create(title: file_name, link: @attachment.diskfile)
    #@note.link= @attachment.diskfile
    #@note.save
    redirect_to action: "index"
   #render "index"

  end



end
