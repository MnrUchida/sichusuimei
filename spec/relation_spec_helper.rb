require 'spec_helper'

shared_examples_for :relation_check do |params|
  let(:key){params[:key]}

  it "#{params[:key]}" do
    subject.should == params[:expected_value]
  end
end

shared_examples_for :relation_get do |params|
  let(:key){params[:key]}

  it "#{params[:key]}" do
    subject.should == expected
  end
end

shared_examples_for :relation_check_for_junishi do |params|
  let(:relation){Junishi.by_key(params[:relation_value])}

  it_behaves_like :relation_check, params
end

shared_examples_for :relation_check_for_jikkan do |params|
  let(:relation){Jikkan.by_key(params[:relation_value])}

  it_behaves_like :relation_check, params
end

shared_examples_for :relation_get_for_junishi do |params|
  let(:expected){Junishi.by_key(params[:relation_value])}

  it_behaves_like :relation_get, params
end

shared_examples_for :relation_get_for_jikkan do |params|
  let(:expected){Jikkan.by_key(params[:relation_value])}

  it_behaves_like :relation_get, params
end

shared_examples_for :relation_check_for_pillar do |params, chishi, tenkan|
  let(:relation){MeishikiPlr.new(:chishi_id => chishi.id, :tenkan_id => tenkan.id)}

  it_behaves_like :relation_check, params
end

shared_examples_for :relation_check_for_pillar_by_junishi do |params|
  it_behaves_like :relation_check_for_pillar, params, Junishi.by_key(params[:relation_value]), Jikkan.by_key('kinoe')
end

shared_examples_for :relation_check_for_pillar_by_jikkan do |params|
  it_behaves_like :relation_check_for_pillar, params, Junishi.by_key('ne'), Jikkan.by_key(params[:relation_value])
end

shared_examples_for :relation_check_for_pillar_by_junishi_with_relations do |params|
  before do
    @relations = params[:relations].map{|relation| relation[:type].new(:chishi_id => Junishi.by_key(relation[:value]).id, :tenkan_id => Jikkan.by_key('kinoe').id)}
  end
  let(:relations){@relations}
  it_behaves_like :relation_check, params
end

shared_examples_for :relation_check_for_pillar_by_jikkan_with_relations do |params|
  before do
    @relations = params[:relations].map{|relation| MeishikiPlr.new(:chishi_id => Junishi.by_key('ne').id, :tenkan_id => Jikkan.by_key(relation).id)}
  end
  let(:relations){@relations}
  it_behaves_like :relation_check, params
end

shared_examples_for :relation_check_for_gogyo do |params|
  let(:relation){Gogyo.by_key(params[:relation_value])}

  it_behaves_like :relation_check, params
end

shared_examples_for :relation_get_for_gogyo do |params|
  let(:expected){Gogyo.by_key(params[:relation_value])}

  it_behaves_like :relation_get, params
end
