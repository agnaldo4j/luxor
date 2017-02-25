defmodule ServerTest do
  use ExUnit.Case, async: true
  doctest Kaizen.GithubAdapter

  test 'logged user info' do
    result = GenServer.call(:github_adapter, {:user_info, '87224a8528cde2c1a2650015e842dadc39573727'})
    assert "agnaldo4j@gmail.com" == result.email
  end

  test 'repositories from logged user' do
    result = GenServer.call(:github_adapter, {:repositories, '87224a8528cde2c1a2650015e842dadc39573727'})
    assert Enum.empty?(result) == false
  end

  test 'organizations from logged user' do
    result = GenServer.call(:github_adapter, {:organizations, '87224a8528cde2c1a2650015e842dadc39573727'})
    assert 2 == Enum.count(result)
  end

  test 'repositories from owner' do
    result = GenServer.call(:github_adapter, {:repositories_from_owner, 'agnaldo4j', '87224a8528cde2c1a2650015e842dadc39573727'})
    assert 5 == Enum.count(result)
  end

  test 'repositories from org' do
    result = GenServer.call(:github_adapter, {:repositories_from_org, 'tuist', '87224a8528cde2c1a2650015e842dadc39573727'})
    assert Enum.empty?(result) == false
  end

  test 'projects from org' do
    result = GenServer.call(:github_adapter, {:projects_from_org, 'tuist', '87224a8528cde2c1a2650015e842dadc39573727'})
    assert 1 == Enum.count(result)
  end

  test 'projects from owner and repo' do
    result = GenServer.call(:github_adapter, {:projects_from_owner_and_repo, 'tuist', 'tuist-manager', '87224a8528cde2c1a2650015e842dadc39573727'})
    assert 1 == Enum.count(result)
  end

  test 'columns from project' do
    result = GenServer.call(:github_adapter, {:columns_from_project, '329354', '87224a8528cde2c1a2650015e842dadc39573727'})
    assert Enum.empty?(result) == false
  end

  test 'cards from column' do
    result = GenServer.call(:github_adapter, {:cards_from_column, '583589', '87224a8528cde2c1a2650015e842dadc39573727'})
    assert false == Enum.empty?(result)
  end

  test 'issues from owner and repo' do
    result = GenServer.call(:github_adapter, {:issue_from_owner_and_repo, 'tuist', 'tuist-manager', '87224a8528cde2c1a2650015e842dadc39573727'})
    assert false == Enum.empty?(result)
  end

  test 'wrong token' do
    result = GenServer.call(:github_adapter, {:user_info, '87224a8528cde2c1a2650015e842dadc39573726'})
    assert nil == result.email
  end
end 
