<?php

class SearchController extends BaseController {

	protected $layout = 'layouts.profile';

	public function search() {
		$query  = Input::get('q');

		$results = Profile::search($query)
		            ->with('users')
		            ->with('gender')
		           	->paginate(10);
        if(count($results) === 0) {
        	$results = null;
        	$msg = 'No result found for your search.';
        }
        $params = array(
        	'results' => $results,
    		'query' => $query
    	);
        $this->layout->content = View::make('search.results');
        return View::make('search.results')
            ->with($params);
	}
    public function ajaxSearch() {
        $query  = Input::get('q');

        $results = Profile::search($query)
                    ->with('users')
                    ->with('gender')
                    ->paginate(10);
        if(count($results) === 0) {
            $results = null;
            $msg = 'No result found for your search.';
        }
        $params = array(
            'results' => $results,
            'query' => $query
        );
        $this->displayResults($params);
    } 
    public function displayResults($params) {
        $this->layout->content = View::make('search.results');
        return View::make('search.results')
            ->with($params);
    } 

}