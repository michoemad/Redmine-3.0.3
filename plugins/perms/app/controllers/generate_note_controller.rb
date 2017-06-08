class GenerateNoteController < ApplicationController
  #["Release Owner", "Release Date", "Document Date", 
  #{}"Systems Affected", "Release Purpose", "Target Systems", "SVN Revision #", "Revision Start", "Revision End", "Emergency Contact", "Release Liaison"] 

  def create
  	@issue=Issue.find(params["issue_id"])
  	i=@issue.custom_field_values
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
 "gen_button"=>"gen_int",
 "relOwner_ext"=>i[0].value,
 "relDate_ext"=>"",
 "docDate_ext"=>"08/06/2017",
 "relDesc_ext"=>"",
 "project_id"=>"sing"})
  	x = Net::HTTP.post_form(URI('http://192.168.99.11:8100/createLatexDoc'),p)
  	
	tempfile = Tempfile.new('new.pdf')
 	File.open(tempfile.path,'wb') do |f|
       f.write x.body
   	end
   file_name = x['content-disposition'][/filename(.*)/][10..-2]
   send_file tempfile.path, filename: file_name


end

end
