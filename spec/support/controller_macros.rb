module ControllerMacros

  def login_admin
    let(:current_user) { FactoryGirl.create(:user, :admin) }

    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in current_user
    end
  end

  def login_manager
    let(:current_user) { FactoryGirl.create(:user, :manager) }

    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in current_user
    end
  end

  def login_cashier
    let(:current_user) { FactoryGirl.create(:user, :cashier) }

    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in current_user
    end
  end

  def login_processing
    let(:current_user) { FactoryGirl.create(:user, :processing) }

    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in current_user
    end
  end


end
