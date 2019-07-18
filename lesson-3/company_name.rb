module CompanyName
  @train_company_name = nil
  def company_name_save(company_name)
    @train_company_name = company_name
  end

  def company_name_show
    p @train_company_name
  end
end
