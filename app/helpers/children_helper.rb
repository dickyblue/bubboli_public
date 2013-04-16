module ChildrenHelper

  def is_a_valid_email?(term)
    term.match(/^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i) if term
  end

end
