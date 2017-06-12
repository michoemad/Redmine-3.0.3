class GenerateNoteController < ApplicationController
  #["Release Owner", "Release Date", "Document Date", 
  #{}"Systems Affected", "Release Purpose", "Target Systems", "SVN Revision #", "Revision Start", "Revision End", "Emergency Contact", "Release Liaison"] 


  def new

  	@issue= Issue.find(params[:issue_id])
  	@project=@issue.project
  	respond_to do |format|
  		format.html { render :template => 'generate_note/new'}
  		format.pdf do
		        render pdf: "Leo",
               template: "generate_note/new.pdf.erb",
               locals: {:project => @project,:issue => @issue}
               
  		end

  	end

  end


  def create()
  	
  	p=gen_p(params["is_internal"]=="true")
  	 
  	x = Net::HTTP.post_form(URI('http://192.168.99.11:8100/createLatexDoc'),p)
  	if ((x.code=="200")&&x)
		tempfile = Tempfile.new('new.pdf')
	 	File.open(tempfile.path,'wb') do |f|
	       f.write x.body
	   	end
	   file_name = x['content-disposition'][/filename(.*)/][10..-2]
	   send_file tempfile.path, filename: file_name
	   Attachment.create(file: tempfile,author:User.current,filename:file_name,container_id: @issue.id,container_type: "Issue")
	   flash[:notice]= "Attachment creation successful"
	else
		render inline: x.body and return
		

	end

end

	private

	def gen_p(is_internal)
	  	@issue=Issue.find(params["issue_id"])
	  	i=@issue.custom_field_values
	  	if @issue.tracker_id != Tracker.find_by(name:"Release").id
	  		render_error "Issue must be of type 'Tracker' "
	  		return
	  	end
		if is_internal

		 	p=ActionController::Parameters.new({"relOwner"=>User.find(i[0].value).name,
		 "relDate"=>i[1].value,
		 "docDate"=>i[2].value,
		 "sysAffected"=>i[3].value,
		 "targetSys"=>i[5].value,
		 "purpose"=>i[4].value,
		 "relDesc"=>@issue.description,
		 "redmineNum"=>@issue.id,
		 "repoName"=>i[6].value,
		 "svnRevisionStart"=>i[7].value,
		 "svnRevisionEnd"=>i[8].value,
		 "relTroubleshoot"=>i[9].value,
		 "relLiaison"=>i[10].value,
		 "gen_button"=>"gen_int"})

		 else
		 	p=ActionController::Parameters.new({
 		 "gen_button"=>"gen_ext",
		 "relOwner_ext"=>i[0].value,
		 "relDate_ext"=>i[1].value,
		 "docDate_ext"=>i[2].value,
		 "relDesc_ext"=>@issue.description,
		 "targetSys_ext"=>i[5].value
		 		})

		 end
	end

end
