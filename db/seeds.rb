# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Setting.delete_all
Setting[:'vecktor.first_year'] = 1992
Setting[:'vecktor.editor']     = 'Johan Förberg F10'
Setting[:'vecktor.publisher']  = 'Björn Hansson F09'

Role.delete_all
admin = Role.create(
    :description => 'Admin', 
    :tag => 'admin',
    :title => 'Admin',
)
nobody = Role.create(
    :description => 'Vem som helst',
    :tag => 'nobody',
    :title => 'Pöbel',
)
cafem = Role.create(
    :description => 'Cafémästaren bossar över Hilbert Café. Man har hand om bokföring, inköp av bröd och varor, håller kontakt med leverantörer. Som Cafémästare sitter man till skillnad från många andra funktionärer bara i ett halvår, detta på grund att att man väljs in som vice Cafémästare i ett halvår först för att sedan automagiskt bli Cafémästare efter detta.',
    :tag => 'cafe',
    :title => 'Cafémästare',
)

vcafem = Role.create(
    :title => 'Vice Cafémästare',
    :tag => 'vicecafe',
    :description => 'Cafémästarens slav.',
)

User.delete_all
root = User.create(
    :username => 'root',
    :real_name => 'Charlie Root',
    :email => 'root@fsek.lth.se',
    :password => 'rootroot',
    :password_confirmation => 'rootroot',
    :role_ids => [admin.id],
)
linus = User.create(
    :username => 'linus',
    :real_name => 'Linus Hammarlund',
    :email => 'linus.snail@gmail.com',
    :password => 'hejhej',
    :password_confirmation => 'hejhej',
    :role_ids => [nobody.id, cafem.id],
)

johan = User.create(
    :username => 'jforberg',
    :real_name => 'Johan Förberg',
    :email => 'johan@forberg.se',
    :password => 'hopphopp',
    :password_confirmation => 'hopphopp',
    :role_ids => [nobody.id],
)

News.delete_all
News.create(
	:title => 'Markdown',
	:text => %{*Markdown* är ett lite tuffare sätt att formatera text. Syftet
med *Markdown* är att efterlikna vanliga mailkonversationer så mycket som 
möjligt. Varför krångla till det?

I Markdown kan man skriva **o-ordnade listor**:
 * En
 * Två 
 * Två och en halv
 * Tre

**Ordnade listor:**
 1. Hej
 2. Hopp
 3. Jättesnopp
 
Man kan även skriva vanliga hyperlänkar på ett finurligt sätt. 
[Wikipedia](http://en.wikipedia.org/) är en hemsida där man kan lära sig 
mycket, om man kommer igåg att ta innehållet med en stor nypa salt.},
    :user_id => johan.id,
)

News.create(
	:title => 'Valborg i Uppsala',
	:text =>
		"Även fast det senast *påskafton* snöade här i vårt kära Lund
så är, tro det eller ej, våren på väg. Förutom solsken, blommor och bin kommer
även **Valborg** med våren. Denna högtid firas traditionsenligt den 30 april för
att hälsa våren välkommen genom att festa som as! Att festa som as görs bäst på
bortaplan därför anordnas det liksom i fjol en resa till Uppsala över Valborg.
Det studentikosa Uppsala erbjuder allt från fulsittning till forsränning under
Valborg! Vi lämnar Lund den 29e april och reser hem igen den 1a maj. För
anmälan och mer information kontakta:",
    :user_id => linus.id,
)

News.create(
	:title => 'Hälsovecka på F',
	:text => %{Nu är det äntligen dags för årets hälsovecka på F-sektionen!
En chans för just dig att lära dig mer om hälsa och testa på nya roliga
aktiviteter. Mellan den 17:e och den 23:e april erbjuder F-sektionens
idrottsutskott sektionens medlemmar att prova på och utveckla sin hälsa genom
ett flertal olika aktiviteter.},
    :user_id => johan.id,
)
News.create(
	:title => 'Störningar på hemsidan',
	:text => %{Den kommande veckan så kan det förekomma störningar på
hemsidan såsom att den ligger nere helt. Detta beror på renoveringar av
sektionens lokaler men förhoppnigsvis kommer detta endast att gälla begränsade
tider.  Vid uthämtning av nycklar till F-bilen kontakta Björn Hansson,
telefonnummer går att hitta under "Styrelsen" till vänster på hemsidan eller
anslaget på SK's dörr.},
    :user_id => root.id,
)

