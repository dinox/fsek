require 'xmlsimple'

def vecktor_clean
  Vecktor.delete_all
  VecktorNotice.delete_all
end

def vecktor_get
  vecktor_data = XmlSimple.xml_in 'db/old_vecktors.xml'
  notice_data  = XmlSimple.xml_in 'db/old_notices.xml'
  [vecktor_data, notice_data]
end

def vecktor_load
  vecktor_data = XmlSimple.xml_in 'db/old_vecktors.xml'
  notice_data  = XmlSimple.xml_in 'db/old_notices.xml'

  vecktor_data['vecktorer'].each do |row|
    v_old_id = row['id'][0].to_i
    v = Vecktor.new
    v.date    =  row['datum'][0].to_date
    v.publish if row['skickad'][0].to_i == 1
    v.year    =  row['argang'][0].to_i
    v.issue   =  row['nummer'][0].to_i
    v.editor_name    = row['redaktor'][0]
    v.publisher_name = row['ansvarig_utgivare'][0]
    notice_data['notiser'].each do |n_row|
      if n_row['vecktor_id'][0].to_i == v_old_id
        n = VecktorNotice.new
        n.title     = n_row['rubrik'][0]
        n.text      = n_row['text'][0]
        n.signature = n_row['signatur'][0]
        n.order_    = n_row['ordning'][0]
        n.vecktor   = v
        n.save
      end
    v.save
    end
  end
  true
end
