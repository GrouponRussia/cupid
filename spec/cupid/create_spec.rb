describe Cupid::Create do
  subject { Cupid::Test }

  def uniq_name(label)
    "#{label} #{Time.now.to_i}"
  end

  shared_examples_for :creation do
    it { creation.should be }
    it { expect { creation }.to change { subject.send(items).size }.by 1 }
  end

  context '#create_folder' do
    let(:parent)    { subject.folders.first }
    let(:name)      { uniq_name :folder }
    let(:items)     { :folders }
    let(:creation)  { subject.create_folder name, parent }

    it_should_behave_like :creation
  end

  context '#create_email' do
    let(:name)      { uniq_name :subject }
    let(:items)     { :emails }
    let(:creation)  { subject.create_email name, :body }

    it_should_behave_like :creation
  end

  context '#create_delivery' do
    let(:email)     { subject.emails.last }
    let(:list)      { subject.lists.find {|it| it[:list_name] == 'Test send' }}
    let(:items)     { :deliveries }
    let(:creation)  { subject.create_delivery email, list }

    it_should_behave_like :creation
  end

  context '#create_path' do
    let(:new_folders) {['my emails', Time.now.to_i, 'level2', 'level3']}

    it do
      expect {
        subject.create_path *new_folders
      }.to change { subject.folders.size }.by new_folders.size - 1
    end
  end
end
