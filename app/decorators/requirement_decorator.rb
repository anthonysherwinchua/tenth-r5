class RequirementDecorator < BaseDecorator

  def document_was
    @document_was ||= changes.include?(:document_id) ? Document.find(changes[:document_id].first) : document
  end

end
