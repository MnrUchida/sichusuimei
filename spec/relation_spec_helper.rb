require 'spec_helper'

shared_examples_for :relation_check_validation do |params|
  let(:key){params[:key]}

  it "#{params[:key]}" do
    subject.should == params[:expected_value]
  end
end

shared_examples_for :relation_get_validation do |params|
  let(:key){params[:key]}

  it "#{params[:key]}" do
    subject.should == expected
  end
end

shared_examples_for :relation_check_validation_junishi do |params|
  let(:relation){Junishi.by_key(params[:relation_value])}

  it_behaves_like :relation_check_validation, params
end

shared_examples_for :relation_check_validation_jikkan do |params|
  let(:relation){Jikkan.by_key(params[:relation_value])}

  it_behaves_like :relation_check_validation, params
end

shared_examples_for :relation_get_validation_junishi do |params|
  let(:expected){Junishi.by_key(params[:relation_value])}

  it_behaves_like :relation_get_validation, params
end

shared_examples_for :relation_get_validation_jikkan do |params|
  let(:expected){Jikkan.by_key(params[:relation_value])}

  it_behaves_like :relation_get_validation, params
end

shared_examples_for :relation_check_validation_pillar do |params, chishi, tenkan|
  let(:relation){MeishikiPlr.new(:chishi_id => chishi.id, :tenkan_id => tenkan.id)}

  it_behaves_like :relation_check_validation, params
end

shared_examples_for :relation_check_validation_pillar_junishi do |params|
  it_behaves_like :relation_check_validation_pillar, params, Junishi.by_key(params[:relation_value]), Jikkan.by_key('kinoe')
end

shared_examples_for :relation_check_validation_pillar_jikkan do |params|
  it_behaves_like :relation_check_validation_pillar, params, Junishi.by_key('ne'), Jikkan.by_key(params[:relation_value])
end
