class ScholarlyCommonTest < Test::Unit::TestCase
  
  def test_respond_to
    kev = "url_ver=Z39.88-2004&rfr_id=info:sid/library.jhu.edu%3Axerxes+%28+OmniFile+Full+Text+Mega%29&rft.genre=article&rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&rft.issn=00297917&rft.date=2012&rft.tpages=2+pages&rft.jtitle=Occupational+Health&rft.volume=64&rft.issue=5&rft.spage=14&rft.epage=15&rft.atitle=Inhalation+versus+skin+exposure+%3A+have+we+got+the+balance+right%3F+&rft.aulast=Packham&rft.aufirst=Chris+Partner%2C+EnviroDerm+Services"
    
    openurl = OpenURL::ContextObject.new_from_kev(kev)
    
    assert openurl.referent.respond_to? :jtitle
    assert openurl.referent.respond_to? :atitle    
    
  end
  
end
