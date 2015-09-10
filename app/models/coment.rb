class Coment < ActiveRecord::Base
	belongs_to :article
	has_many:coment_reply

	scope :involving, -> (article) do
    where("coments.article_id =?",article.id)
  end
end
